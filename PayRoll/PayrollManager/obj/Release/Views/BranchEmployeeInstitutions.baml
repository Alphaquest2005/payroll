   M S B A M L   `   `   `  ���� L  HPrintableDataGrid, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullP:clr-namespace:PrintableListView;assembly=PrintableDataGridPrintableListView  I EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager /   )PayrollManager.BranchEmployeeInstitutions   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     Ipl:clr-namespace:PrintableListView;assembly=PrintableDataGrid     .localclr-namespace:PayrollManager       � 	Resources  4  .PayrollManager.BranchEmployeeInstitutionsModel -  )BranchEmployeeInstitutionsModelDataSource  RightAlignStyle �� 
TargetType �� Property �� Value  src �� Source �� Source �� Path��%�   &	        &	      &	 r     7     �� " ��.���  �@��TextAlignment$ Right=���  �@��Padding$	 5,0q���  � ��$ Center=���  �� 8   $ DeductionsData�.��� -    �Name$ 
LayoutRoot�� � DataContext �� # [  .+��� -   	 ��Name$	 	ReportBRD��$��0,66,0,0q�$
��Auto��$
��1000��._��� -   
 ��Name$
 	ReportGrd��$��0,0,0,10q�.��� -   $ DailyReportGD��$��Center=�$
��Auto��$	��Top=�$
��Auto��
�������$
��1000�� �� .+�� $��Stretch=�$��38��$��	40,97,0,0q�$	��Top=�$
��Auto�����	#FFD7D7D7.+��� $��
388,2,42,0q� �� TextAlignment$ Right=�$��Right=�$	��Top=�$	��346��$��36��$��21.333(����	#FF353623���� *PayrollJobTotal+ �� StringFormat$ Gross Job Amount {0:c}���� $��Right=�$��32��$��	0,65,42,0q�$
��Wrap=�$'��!Employee vs Institution Breakdown��$	��Top=�$	��390��$��25(�$ Right=�
���   �
��������� $��546,13,42,0q�$��right=�$	��Top=�$��14.667(�
���   �$	��228��$ Right=����� *Date+�� $��40,140,42,10q� �� Orientation$ Vertical=�.+��� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��237��$��	0,15,0,15q�$��20(����	#FF393939$
 Left=�$��
Deductions��&   System.Windows.Controls.DataGrid  -     Name$ DeductionsGrid��$��Stretch=�$��0q�   AlternatingRowBackground �	#FFE6F0F4   RowBackground
 �����   GridLinesVisibility$
 None=�$	��Top=�   AutoGenerateColumns .     	RowHeight$ 25Q�   ClipboardCopyMode$ IncludeHeader=����� *DeductionsData+ �� IsAsync . �� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��237��$��	0,15,0,15q�$��20(����	#FF393939$
 Left=�$��
Net Salary��  -   $ NetSalaryGrid��$��Stretch=�$��0q� �	#FFE6F0F4
 �����$
 None=�$	��Top=� .  $ 25Q�$ IncludeHeader=����� *NetSalaryData+ . �� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��330��$��	40,50,0,0q�$��14(����	#FF393939$
 Left=�$L��FPrepared By:..........................................................���� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��330��$��	40,20,0,0q�$��14(����	#FF393939$
 Left=�$L��FChecked By:...........................................................���� $
��Left=�$
��29.6��$��37.3,13.4,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��24(����� *Institution1.Name+�� $
��Left=�$��20��$��37.3,48,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountName+�� $
��Left=�$��24��$��	40,73,0,0q�$
��Wrap=�$	��Top=�$	��321��$��16(�$
��Bold"����� *
ReportDate+$  Reporting for {0:MMM-yyyy}���� -     TextButtonStyle#���  $
��Left=�$��30��$��
600,36,0,0q�$
��Wrap=�$��Deductions To Excel��$	��Top=�$	��184��$��20(�$��Segoe UI Symbol)�(  "System.Windows.Controls.DatePicker  $
��Left=�$��30��$��
194,10,0,0q�$	��Top=�$	��237��$��16(�   SelectedDateFormat$ Short=�   SelectedDate �� *
ReportDate+�� $
��Left=�$��30��$��	21,10,0,0q�$
��Wrap=�$��Select Report Date��$	��Top=�$	��149��$��16(��� -   #���  $
��Left=�$��30��$��
824,10,0,0q�$
��Wrap=�$��Print Net Salary ��$	��Top=�$	��173��$��20(�$��Segoe UI Symbol)��� -	   #���  $
��Left=�$��30��$��
600,10,0,0q�$
��Wrap=�$��Print Deductions ��$	��Top=�$	��184��$��20(�$��Segoe UI Symbol)��� -
   #���  $
��Left=�$��30��$��
824,36,0,0q�$
��Wrap=�$��Net Salary To Excel��$	��Top=�$	��184��$��20(�$��Segoe UI Symbol)�