   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  0    *PayrollManager.PayrollEmployeeSetupDetails   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     $��1136.394��  � 	Resources  5   /PayrollManager.PayrollEmployeeSetupDetailsModel .  *PayrollEmployeeSetupDetailsModelDataSource  EditingStartDateTemplate(  "System.Windows.Controls.DatePicker   SelectedDate  StartDateTemplate �� StringFormat��%�   &	        &	      &	 )       �� .R�   �� *	StartDate+�� .R��� $��10(�$��Center=����� *	StartDate+$ {0:MMM-dd-yyyy}��.��� -    �Name$ 
LayoutRoot��$
��Auto��$��0,0,0,0q� � DataContext ��  �� Source# [  .+�� $��0,80,0,0q�.+�&   System.Windows.Controls.DataGrid  -   $��xgrid��$ ��156.96,41.48,-198.84,87.68q�   CanUserResizeRows .    MinRowHeight$ 30Q�   	RowHeight$ 30Q�	   AutoGenerateColumns	 .  
 J� RenderTransformOrigin$
 0.5,0.5&�   AlternatingRowBackground �	#FFE6F0F4   RowBackground
 �����   GridLinesVisibility$
 None=�   CanUserSortColumns .     ClipboardCopyMode$ IncludeHeader=� �� SelectedItem �� *CurrentPayrollEmployeeSetup+���� *PayrollEmployeeSetups+ �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnSourceUpdated .  �� # [  z�V� .~���  �� ScaleX$
 1.25Q� �� ScaleY$
 1.25Q��� �� T�    Columns 4  .System.Windows.Controls.DataGridComboBoxColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Payroll Type��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 125    DisplayMemberPath$
 Name��   SelectedValuePath$ PayrollJobTypeId��   SelectedValueBinding �� *PayrollJobTypeId+$ PropertyChanged=�   ElementStyle ��  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� Path$! DataContext.PayrollJobTypes�  �� RelativeSource  �� ! �� AncestorType"!  "   EditingElementStyle" �� " ��.���  � �� �� $! DataContext.PayrollJobTypes�  �� "!    $ Payroll Item��$	 125 $
 Name��$ PayrollSetupItemId�� �� *PayrollSetupItemId+$ PropertyChanged=� �� " ��.���  � �� �� $$ DataContext.oPayrollSetupItems�  �� "!  " �� " ��.���  � �� �� $$ DataContext.oPayrollSetupItems�  �� "!    $ Debit Account��$	 125 $ AccountName��$ 	AccountId�� �� *DebitAccountId+$ PropertyChanged=� �� " ��.���  � �� �� $$ DataContext.CurrentAccountsLst�  �� "!  " �� " ��.���  � �� �� $$ DataContext.CurrentAccountsLst�  �� "!    $ Credit Account��$	 125 $ AccountName��$ 	AccountId�� �� *CreditAccountId+$ PropertyChanged=� �� " ��.���  � �� �� $$ DataContext.CurrentAccountsLst�  �� "!  " �� " ��.���  � �� �� $$ DataContext.CurrentAccountsLst�  �� "!  0  *System.Windows.Controls.DataGridTextColumn  $ Base Amount��$ 80 1  +System.Windows.Controls.DataGridBoundColumn#   Binding# �� *
BaseAmount+$ c��$ PropertyChanged=�  $ Amount��$ 75 # �� *Amount+$ c��$ PropertyChanged=�  $
 Rate��$ 75 $   ElementStyle$ �� " ��.���  � �� �� *Rate+$
 0.00��$ PropertyChanged=�%   EditingElementStyle% �� " ��.���  � �� �� *Rate+4	  .System.Windows.Controls.DataGridTemplateColumn	  $ 
Start Date��$	 100 & 	  CellTemplate& �� .R��� $��10(�$��Center=����� *	StartDate+$ {0:MMM-dd-yyyy}��$ PropertyChanged=�' 	  CellEditingTemplate' �� .R�   �� *	StartDate+$ PropertyChanged=�	  $ End Date��$	 100 & �� .R��� $��10(�$��Center=����� *	EndDate+$ {0:MMM-dd-yyyy}��$ PropertyChanged=�' �� .R�   �� *	EndDate+$ PropertyChanged=�  $ Company Amount��$	 100 # �� *CompanyAmount+$ c��$ PropertyChanged=�  $ Company Rate��$	 100 $ �� " ��.���  � �� �� *CompanyRate+$
 0.00��$ PropertyChanged=�% �� " ��.���  � �� �� *CompanyRate+	  $ Delete��& �� .R��� ( ��Name$( 	DeleteBtn��-   $
��Left=�$��39��$��0q�$
��Wrap=�$	��Top=�$��35��) �� TextAlignment$) Center=�  CloseButtonStyle#���  $��26.667(�$	����$��Segoe UI Symbol)��� $��847,353,0,0q�$
��Left=�$	��Top=�$��44��$	��118��$��24(�$��Center=�* �� ContentStringFormat$* c�����	#FFFDFDCF���� *CurrentEmployee.PreNetAmount+�� $��364,360,0,0q�$
��Left=�$	��Top=�$��30��$	��151��$��18.667(����	#FFFDFDCF���� * CurrentEmployee.PreTotalIncome+$ c���� $��624,359,0,0q�$
��Left=�$	��Top=�$��31��$	��132��$��18.667(����	#FFFDFDCF���� *$"CurrentEmployee.PreTotalDeductions+$ c���� $
��Left=�$��16��$��294,366,0,0q�$
��Wrap=�$��Income��$	��Top=�$��54��$) Right=�$��14(����	#FFFDFDCF�� $
��Left=�$��22��$��525,368,0,0q�$
��Wrap=�$��
Deductions��$	��Top=�$��81��$) Right=�$��14(����	#FFFDFDCF�� $
��Left=�$��16��$��761,368,0,0q�$
��Wrap=�$��
Net Salary��$	��Top=�$��81��$) Right=�$��14(����	#FFFDFDCF�� $��138,362,0,0q�$
��Left=�$	��Top=�$��30��$	��151��$��18.667(����	#FFFDFDCF���� *(&CurrentPayrollEmployeeSetup.CalcAmount+$ c���� $
��Left=�$��41��$��
32,356,0,0q�$
��Wrap=�$��Selected Item Amount��$	��Top=�$��90��$) Right=�$��14(����	#FFFDFDCF�� $
��Left=�$��30��$��	10,10,0,0q�$
��Wrap=�$%��Add/Edit Employee Payroll Setup��$	��Top=�$	��410��$��20(��� -   + ��Name$+ EmployeeCmb��, �� DisplayMemberPath$, DisplayName��- �� SelectedValuePath$- 
EmployeeId��$��
377,10,0,0q�$
��Left=�$	��Top=�$��35��$	��399��$
 0.501,0.554&�$��16(� �� *CurrentEmployee+. �� Mode$. OneWayToSource=����� *	Employees+# [  �� $
, Name��$- PayrollJobTypeId��$��987.4,10,-108.206,0q�$
��Left=�$	��Top=�$��39��$	��242��$��16(�/ �� SelectedValue/ �� *PayrollJobTypeId+ �� *CurrentPayrollJobType+���� *PayrollJobTypes+�� $
��Left=�$��39��$��806.4,10,0,0q�$
��Wrap=�$��Payroll Job Type Filter��$	��Top=�$	��176��$��14(�