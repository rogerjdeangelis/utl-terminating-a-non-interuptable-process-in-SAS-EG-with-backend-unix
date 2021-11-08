Terminating a non-interuptable process in SAS EG with backend unix

Github
https://tinyurl.com/3jv68z2t
https://github.com/rogerjdeangelis/utl-terminating-a-non-interuptable-process-in-SAS-EG-with-backend-unix


StackOverflow
https://tinyurl.com/4k88zbxj
https://stackoverflow.com/questions/69869189/can-i-terminate-a-running-proc-sql-program-in-sas

If you are not in SAS lockdown, the backend is unix and you can open more that one EG session.

Open a second EG session

Compile this macro

%macro unx(unxcmd);
  filename xeq pipe "&unxcmd";
  data _null_;
    infile xeq;
    input;
    putlog _infile_;
  run;quit;
%mend unx;

* find all the processes under yout userid

%unx(ps -ef | grep <userid>)

* kill the process;

%unx(kill -9 2477);





