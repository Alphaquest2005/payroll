   M S B A M L   `   `   `  ���� O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  I EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager $   PayrollManager.EmployeeDetails   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6sys&clr-namespace:System;assembly=mscorlib     .localclr-namespace:PayrollManager     $��500     ��  � 	Resources  )  #PayrollManager.EmployeeDetailsModel "  EmployeeDetailsModelDataSource  EmployeeAccountTemplate �� Orientation ��Name J� RenderTransformOrigin  TextButtonStyle �� TextAlignment  CloseButtonStyle��%2  &	        &	        �� .R��� $ 
Horizontal=�$	��346��$��28��$��0q�.+��� $
��Left=�$	��Top=�$��126.56��$��0,0,10,0q����� *AccountName+�� $
��Left=�$	��Top=�$	��163��$��0,0,10,0q����� *Accountnumber+�� $ EditBtn��-   $
��Auto��$��0,0,5,0q�$
��Wrap=�$	����$��Stretch=�$��15��$ 
0.256,-0.2&�$��Segoe UI Symbol)�#���  $ Center=����	#FF354F2E�� $ delbtn��-   $
��Auto��$��0,0,5,0q�$
��Wrap=�$	����$��Stretch=�$��15��$ 
0.256,-0.2&�$��Segoe UI Symbol)�#���  $ Center=�.��� -    �Name$ 
LayoutRoot��$��0,61,0.4,0.484q� � DataContext ��  �� Source# [   �� Path$ CurrentEmployee�.+�� $
��Left=�$��0,0,0,-0.484q�$	��Top=�$	��594��$	��439��.+��� 	 �� DisplayMemberPath$
	 Name��
 �� SelectedValuePath$
 BranchId��$��
405,81,0,0q�$
��Left=�$	��Top=�$	��166�� �� SelectedValue �� *
BranchId+���� *
Branches+# [  �� $��
120,54,0,0q�$
��Left=�$	��Top=�$��24��$	��166������ *	FirstName+ �� UpdateSourceTrigger$ PropertyChanged=��� $
��Left=�$��20.323��$��28.316,53.833,0,0q�$
��Wrap=�$	��Top=�$��75.063��$ Right=��� $�
First Name���� �� �� $��
120,83,0,0q�$
��Left=�$	��Top=�$��20��$	��166������ *
MiddleName+$ PropertyChanged=��� $
��Left=�$��20.323��$��28.316,82.648,0,0q�$
��Wrap=�$	��Top=�$��75.063��$ Right=��� $�Middle Name���� �� �� $��119.727,107.948,0,0q�$
��Left=�$	��Top=�$��22.07��$��165.841������ *
LastName+$ PropertyChanged=��� $
��Left=�$��20.323��$��28.316,107.948,0,0q�$
��Wrap=�$	��Top=�$��75.063��$ Right=��� $�	Last Name���� �� �� $��12.369,11.6,0,0q�$
��Left=�$	��Top=�$��28.168��$��435.083��$��18.667(����� *DisplayName+$ PropertyChanged=��� $	 DisplayName��$
 SupervisorId��$��405,108,0,0q�$
��Left=�$	��Top=�$	��166��$y�Hidden=� �� *SupervisorId+���� *	Employees+# [  �� $
��Left=�$��20��$��
314,83,0,0q�$
��Wrap=�$	��Top=�$��75��$ Right=�$��Location���� $
��Left=�$��20��$��314,108,0,0q�$
��Wrap=�$	��Top=�$��75��$ Right=�$y�Hidden=��� $�
Supervisor���� �� �� $��
405,54,0,0q�$	��Top=�$
��Left=�$	��166������ *Title+$ PropertyChanged=��� $
��Left=�$��20��$��
314,54,0,0q�$
��Wrap=�$	��Top=�$��75��$ Right=�$��Title���� -   $ SaveBtn��$
��Left=�$��39��$��419,377,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�#���  $��26.667(��� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$
��Left=�$��39��$��528,377,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�#���  $��26.667(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$
��Left=�$��39��$��379,377,0,0q�$
��Wrap=�$	��Top=�$��34��$ Center=�#���  $��26.667(�$	����$��Segoe UI Symbol)�(  "System.Windows.Controls.DatePicker  $
��Left=�$��28��$��406,116,0,0q�$	��Top=�$	��166��   SelectedDate �� *EmploymentStartDate+$ PropertyChanged=�
 �� Now �� TargetNullValue# Z &   System.Windows.Controls.DataGrid  -   $
��Left=�$	��119��$��
28,228,0,0q�$	��Top=�$	��543��   AutoGenerateColumns .     MinRowHeight$ 30Q�   	RowHeight$ 30Q�$ 0.5,0.5&�   AlternatingRowBackground �	#FFE6F0F4   RowBackground
 �����   GridLinesVisibility$
 None=� �� IsTextSearchEnabled .    ClipboardCopyMode$ IncludeHeader=����� *EmployeeAccounts+   Columns 4  .System.Windows.Controls.DataGridComboBoxColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Institution��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 150    DisplayMemberPath$
 Name��   SelectedValuePath$ InstitutionId��   SelectedValueBinding �� *InstitutionId+$ PropertyChanged=�   ItemsSource �� *Institutions+# [  0  *System.Windows.Controls.DataGridTextColumn  $ Account Number��$	 150 1  +System.Windows.Controls.DataGridBoundColumn    Binding  �� *AccountNumber+$ PropertyChanged=�  $ Salary Assignment��$	 150   �� *SalaryAssignment+! �� StringFormat$! c��$ PropertyChanged=��� $
��Left=�$��40��$��314,116,0,0q�$
��Wrap=�$	��Top=�$��75��$ Right=��� $�Employment Start Date���� �� �� $
��Left=�$��20��$��
28,203,0,0q�$
��Wrap=�$	��Top=�$	��136��$ Right=��� $�Employee Bank Accounts���� �� �� -   $ GenerateItms��$
��Left=�$��26��$��212,384,0,0q�$
��Wrap=�$	��Top=�$	��142��$ Center=�#���  $ ��14                        (�$ 1.527,0.277&��� $��Segoe UI Symbol)�$ en-us�.��� $�Employee AutoSetup���� $��120,151,0,0q�$
��Left=�$	��Top=�$��23��$	��166������ *EmailAddress+$ PropertyChanged=��� $
��Left=�$��21��$��
28,151,0,0q�$
��Wrap=�$	��Top=�$��76��$ Right=�$��Email Address��  $
��Left=�$��28��$��406,161,0,0q�$	��Top=�$	��166�� �� *EmploymentEndDate+$ PropertyChanged=��� $
��Left=�$��40��$��314,161,0,0q�$
��Wrap=�$	��Top=�$��75��$ Right=��� $�Employment End Date���� �� �� $
��Left=�$��39��$��
17,-44,0,0q�$
��Wrap=�$��Add/Edit Employees��$	��Top=�$	��202��$��21.333(��� $
	 Name��$
 PayrollJobTypeId��$��
32,384,0,0q�$
��Left=�$	��Top=�$��25��$	��162��$��16(�" �� SelectedItem" �� *CurrentPayrollJobType+���� *PayrollJobTypes+# [  �� $
��Left=�$��25��$��
32,354,0,0q�$
��Wrap=�$.��(Select Payroll Job Type to Auto Generate��$	��Top=�$	��259��$��14(�