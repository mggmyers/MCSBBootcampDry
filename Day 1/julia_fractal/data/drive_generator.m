% Matt Bovyn, mbovyn@uci.edu
% Drive generate_fractal.m

% Set model parameter
c = -0.8 - 0.156*1i;

%set the path to the repo
<<<<<<< HEAD:Day 1/julia_fractal/data/drive_generator.m
%absolutePathToRepo='/Users/matthewbovyn/project_code/MCSBBootcampDry/Day 1/julia_fractal';
absolutePathToRepo = 'C:\bootcamp_dry\MCSBBootcampDry\Day 1\julia_fractal';%cd;


localpath=pwd;

%run generate_fractal script
run([absolutePathToRepo '\codebase\generate_fractal_MM.m'])


=======
absolutePathToRepo='/Users/matthewbovyn/project_code/BootCampDry_allardjun/MCSBBootCampDry/Day 1/julia_fractal';
localpath=pwd;

%run generate_fractal script
run([absolutePathToRepo '/codebase/generate_fractal.m'])
>>>>>>> master:Day 1/julia_fractal/drive_generator.m

%save the unique identifier of the git commit used to generate the data
cd(absolutePathToRepo);
system('git log -1 --pretty=format:%H > "CommitUsedHash.txt"');
movefile('CommitUsedHash.txt',[ localpath '/CommitUsedHash.txt'])
cd(localpath);

% Save to file
save('juliaSet.mat', 'p', 'nmax_complex');
