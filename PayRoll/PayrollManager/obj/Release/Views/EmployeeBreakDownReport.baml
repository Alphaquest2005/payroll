   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  ,    &PayrollManager.EmployeeBreakDownReport   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  1   +PayrollManager.EmployeeBreakDownReportModel *  &EmployeeBreakDownReportModelDataSource��%   &	          .��� -    �Name$ 
LayoutRoot��$
��1056��$��0q� � DataContext ��  �� Source# [  .+��� -    ��Name$ 	ReportBRD��$��	0,45,0,10q�$
��Auto��$
��Auto=���. .���� -   $ 	ReportGrd��$��0,0,0,10q�$
��Auto����. .��� -   $ DailyReportGD��$
��Left=�$
��Auto��$	��Top=�$
��Auto��
�������$
��1056�� �� .+�� $��Stretch=�$��38��$��	40,97,0,0q�$	��Top=�$
��Auto�����	#FFD7D7D7.+��� $��
388,2,42,0q� �� TextAlignment$ Right=�$��Right=�$	��Top=�$	��346��$��36��$��21.333(����	#FF353623���� *PayrollJobTotal+ �� StringFormat$ Gross Job Amount {0:c}���� $��Right=�$
��31.8��$��460,65.2,42,0q�$
��Wrap=�$��Employee Breakdown��$	��Top=�$	��314��$��25(�$ Right=�
���   �
��������� $��546,13,42,0q�$��right=�$	��Top=�$��14.667(�
���   �$	��228��$ Right=����� *Date+�� $��40,140,42,10q� �� Orientation$ Vertical=�$
��Auto��.+��� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��237��$��	0,15,0,15q�$��20(����	#FF393939$
 Left=�$��Payroll Item Summary��&   System.Windows.Controls.DataGrid  -     Name$ GridData��$��Stretch=�$
��Auto��$��0q�	   AlternatingRowBackground	 �	#FFE6F0F4
   RowBackground

 �����   GridLinesVisibility$
 None=�$	��Top=�   AutoGenerateColumns .     	RowHeight$ 25Q�   ClipboardCopyMode$ IncludeHeader=����� *EmployeeBreakDown+ �� IsAsync . �� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��330��$��	40,50,0,0q�$��14(����	#FF393939$
 Left=�$L��FPrepared By:..........................................................���� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��330��$��	40,20,0,0q�$��14(����	#FF393939$
 Left=�$L��FChecked By:...........................................................���� $
��Left=�$
��29.6��$��37.3,13.4,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��24(����� *Institution1.Name+�� $
��Left=�$��20��$��37.3,48,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountName+�� $
��Left=�$��24��$��	40,73,0,0q�$
��Wrap=�$	��Top=�$	��321��$��16(�$
��Bold"����� *CurrentPayrollJob.Name+�� -     TextButtonStyle#���  $
��Left=�$��30��$��
951,10,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)��� -   #���  $
��Left=�$��30��$��
797,10,0,0q�$
��Wrap=�$��	Excel ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)�