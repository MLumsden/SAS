/* Import File*/
proc import datafile="/folders/myfolders/blended-account_exp.xlsx"
		    out=WORK.BlendedExpen
		    DBMS=XLSX 
		    replace;
run;

/*Descriptive Statistics*/
proc contents data=WORK.BlendedExpen; 
run;
proc means data=WORK.BlendedExpen N MEAN STD MEDIAN QRANGE MIN MAX CV;
           var Diseases_of_the_musculoskeletal Diseases_of_the_circulatory_syst Diseases_of_the_respiratory_syst Endocrine__nutritional__and_meta Diseases_of_the_nervous_system_a Neoplasms;
run;

/*Data Visualization*/
title %upcase(U.S. Expenditures by Medical Condition);
footnote 'Source: Blended Account, Health Care Satellite Account, Bureau of Economic Analysis';
proc sgplot data=WORK.BlendedExpen;
            series x=Year  y=Diseases_of_the_circulatory_syst / lineattrs=(thickness=2) legendlabel="Circulatory";
            series x=Year  y=Diseases_of_the_musculoskeletal / lineattrs=(thickness=2) legendlabel="Musculoskeletal";
            series x=Year  y=Diseases_of_the_respiratory_syst / lineattrs=(thickness=2) legendlabel="Respiratory";
            series x=Year  y=Endocrine__nutritional__and_meta / lineattrs=(thickness=2) legendlabel="Endocrine";
            series x=Year  y=Diseases_of_the_nervous_system_a / lineattrs=(thickness=2) legendlabel="Nervous System";
            series x=Year  y=Neoplasms / lineattrs=(thickness=2) legendlabel="Neoplasms";
            xaxis grid values=(2000 to 2014 by 2) valueshint;
            yaxis label="Expenditures ($Billions)";
run;
footnote;
title;

