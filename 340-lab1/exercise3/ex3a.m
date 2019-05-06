A=[
%3rows from graph1
[0 0 0  0 0 0  1 1 1 ];
[0 0 0  1 1 1  0 0 0 ];
[1 1 1  0 0 0  0 0 0 ];
%3rows from graph2
[0 0 0  0 0 1  0 1 1 ];
[0 0 1  0 1 0  1 0 0 ];
[1 1 0  1 0 0  0 0 0 ];
%3rows from graph3
[0 0 1  0 0 1  0 0 1 ];
[0 1 0  0 1 0  0 1 0 ];
[1 0 0  1 0 0  1 0 0 ];
%3rows from graph4
[0 1 1  0 0 1  0 0 0 ];
[1 0 0  0 1 0  0 0 1 ];
[0 0 0  1 0 0  1 1 0 ];
];

B=[13.00,15.00,8.00,14.79,14.31,3.81,18.00 ,12.00,6.00,10.51,16.13,7.04];
reduced_A=[
%graph1
[0 0 0  0 0 0  1 1 1 ];
[0 0 0  1 1 1  0 0 0 ];
[1 1 1  0 0 0  0 0 0 ];
%graph2 (1 row reduced)
[0 0 0  0 0 1  0 1 1 ];
[0 0 1  0 1 0  1 0 0 ];

%graph3 (1 row reduced)
[0 0 1  0 0 1  0 0 1 ];
[0 1 0  0 1 0  0 1 0 ];

%graph4 (1 row reduced)
[0 1 1  0 0 1  0 0 0 ];
[1 0 0  0 1 0  0 0 1 ];

];

%select the corresponding sum from the graph
reduced_B=[13.00,15.00,8.00,14.79,14.31,18.00,12.00,10.51,16.13];

%calculate x from bullt-in lu fuction
[L,U]=lu(reduced_A);
lu_x=U\(L\reduced_B');
disp(reshape(lu_x,[3 3])');

%Directly calculate x by "\" operator

x=A\B';
disp(reshape(x,[3 3])');

%Our solution is much better since we satisfied more equation,also,since we
%reduced the size of matrix, the calculation time is less.


