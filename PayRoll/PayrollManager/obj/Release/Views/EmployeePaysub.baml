   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  #    PayrollManager.EmployeePaysub   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  )   #PayrollManager.EmployeePayStubModel "  EmployeePayStubModelDataSource��%   &	          .��� -    �Name$ 
LayoutRoot��.+��� -    ��Name$ 	ReportBRD��$��25,42,4.716,28q�$	��867��._��� -    ��Name$ 	ReportGrd��$��	0,10,0,20q�.��� -   $ DailyReportGD��$��Center=�$
��Auto��$	��Top=�$	��816��
������� � DataContext ��  �� Source# [  .+�� $
��Left=�$��27��$��	40,84,0,0q�$	��Top=�$	��734�����	#FFD7D7D7�� $��
630,85,0,0q�$
��Left=�$	��Top=�$	��129��$��26��$��21.333(����	#FF353623���� *CurrentEmployee.NetAmount+ �� StringFormat$ c���� $��Center=�$��32��$��
460,9,42,0q�$
��Wrap=�$��Employee Payment Report��$	��Top=�$	��314��$��25(� �� TextAlignment$ Right=�
���   �
��������� $��
460,59,0,0q�$
��Left=�$	��Top=�$��14.667(�
���   �$	��314��$ Right=����� *CurrentPayrollJob.Name+�� $��40,111,42,40q� �� Orientation$ Vertical=�$
��Auto��.+��� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��259��$��	0,15,0,15q�$��20(����	#FF393939$
 Left=�$��Income ��&   System.Windows.Controls.DataGrid  -   	  Name$	 IncomeDataGrid��
   AutoGenerateColumns
 .  $
��Left=�$
��Auto��$	��Top=�$	��690��
�������   CanUserAddRows .     	RowHeight$ 28Q�   GridLinesVisibility$
 None=�   AlternatingRowBackground �	#FFCFCCCC$��16(�$��13,0,0,0q����� *IncomePayrollLineItems+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ LineItemDescription��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *LineItemDescription+ �� Mode$ OneWay=�   ClipboardContentBinding Z�   $ CurrentAmount��$	 150  �� *CurrentAmount+$ c�� Z�   $ 
YearAmount��$	 150  �� *
YearAmount+$ c�� Z� �� $
��Left=�$��24��$
��Wrap=�$��
Deductions��$	��Top=�$��	0,15,0,15q�$	��237��$��20(����	#FF393939$
 Left=�  -   $	 DeductionDataGrid��$
��Left=�$
��Auto��$	��Top=�$	��690��
�������
 .   .  $ 28Q�$
 None=� �	#FFCFCCCC$��16(�$��12,0,0,0q����� *DeductionPayrollLineItems+   $ LineItemDescription��$	 200  �� *LineItemDescription+$ OneWay=� Z�   $ CurrentAmount��$	 150  �� *CurrentAmount+$ c�� Z�   $ 
YearAmount��$	 150  �� *
YearAmount+$ c�� Z� �� $
��Left=�$��30��$��	37,13,0,0q�$
��Wrap=�$	��Top=�$	��368��$��24(����� *CurrentEmployee.DisplayName+�� $
��Left=�$��20��$��	37,59,0,0q�$
��Wrap=�$	��Top=�$	��243��$��16(����� *CurrentEmployee.Title+�� -     TextButtonStyle#���  $
��Left=�$��30��$��
792,10,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)��� -   #���  $
��Left=�$��30��$��
692,10,0,0q�$
��Wrap=�$��	Email ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)��� -	   #���  $
��Left=�$��30��$��
555,10,0,0q�$
��Wrap=�$��Email All ��$	��Top=�$	��114��$��20(�$��Segoe UI Symbol)�