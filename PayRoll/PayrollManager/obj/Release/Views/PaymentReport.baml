   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager      PayrollManager.Paysub   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     $��552.835��  � 	Resources      PayrollManager.PaysubModel   PaysubModelDataSource  
AlignRight �� 
TargetType �� Property �� Value  DebitAccountEntriesTmp �� Mode �� StringFormat  CreditAccountEntriesTMP��%!  &	        &	      &	 +     &	       �� " ��.���  � ��$ Right=��� .R�� $
��40.8��$��315.2��.+��� $��0,1.4,62.4,20.4q����� *" PayrollItem.Employee.DisplayName+$ OneWay=��� $��252.8,1.4,-24.8,25.4q����� *)'PayrollItem.CreditAccount.AccountNumber+$ 	Acct#:{0}���� $
��Left=�$��1     ��$��
0,35.8,0,0q�
�������$	��Top=�$��315.2���� $��0,20.4,154.6,5q����� *PayrollItem.Name+$ Memo:{0}���� $
��Left=�$
��27.2��$��433,1.4,-172.8,0q�$
��Wrap=�$	��Top=�$��55������ *DebitAmount+$ c���� .R�� $
��40.8��$��315.2��.+��� $��0,1.4,62.4,20.4q����� *" PayrollItem.Employee.DisplayName+$ OneWay=��� $��165.6,20.4,62.4,6.4q����� *(&PayrollItem.DebitAccount.AccountNumber+$ 	Acct#:{0}���� $
��Left=�$��1     ��$��
0,35.8,0,0q�
�������$	��Top=�$��315.2���� $��0,20.4,154.6,5q����� *PayrollItem.Name+$ Memo:{0}���� $
��Left=�$
��27.2��$��260.2,3.6,0,0q�$
��Wrap=�$	��Top=�$��55������ *CreditAmount+$ c��.��� -    �Name$ 
LayoutRoot�� � DataContext ��  �� Source# [  .+��� -   	 ��Name$	 	ReportBRD��$��25,80,4.716,28q�$	��867��
 �� Padding$
 0,0,0,40q�._��� -    ��Name$ 	ReportGrd��$��0,0,0,0q���. .��� -   $ DailyReportGD��$��Center=�$
��Auto��$	��Top=�$	��816��
������� �� *CurrentInstitutionAccount+.+�� $
��Left=�$��38��$��	40,97,0,0q�$	��Top=�$	��734�����	#FFD7D7D7.+��� $��	557,2,0,0q� �� TextAlignment$ Right=�$
��Left=�$	��Top=�$	��177��$��36��$��21.333(����	#FF353623���� *
NetTotal+$ c���� $��Center=�$
��31.8��$��460,65.2,42,0q�$
��Wrap=�$��Payment Report��$	��Top=�$	��314��$��25(�$ Right=�
���   �
��������� $��154.3,64.8,0,0q�$
��Left=�$	��Top=�$��14.667(�
���   ����� *Date+�� $��40,140,42,20q� �� Orientation$ Vertical=�.+��� $��10,0,10.4,0q�$ 
Horizontal=�$��Stretch=�$��50��.+��� $��Debits��$
��Left=�$��34��$
��Wrap=�$	��Top=�$	��489��$��20(����	#FF393939$
 Left=�$��0,0,0,0q��� $��Right=�$��34��$
��Wrap=�$	��Top=�$	��227��$��20(����	#FF393939$
 Left=����� *NetTotalDebit+$ c��&   System.Windows.Controls.DataGrid  $
��Left=�$
��Auto��$	��Top=�$	��690��
�������   AutoGenerateColumns .     CanUserAddRows .     	RowHeight$ 28Q�   GridLinesVisibility$
 None=�   AlternatingRowBackground �	#FFCFCCCC$��16(�$��	13,0,0,15q�   ClipboardCopyMode$ IncludeHeader=����� *CurrentEmpNetDebitEntries+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Employee��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
Employee+$ OneWay=�   ClipboardContentBinding Z�   $ Account Number��$	 150  �� *Account.AccountNumber+$ 
Acct#: {0}�� Z�   $ Amount��$	 100    ElementStyle# [  �� *Total+$ c�� Z� �� $��10,0,10.4,0q�$ 
Horizontal=�$��Stretch=�$��50��.+��� $��Credits��$
��Left=�$��34��$
��Wrap=�$	��Top=�$	��489��$��20(����	#FF393939$
 Left=�$��0,0,0,0q��� $��Right=�$��34��$
��Wrap=�$	��Top=�$	��227��$��20(����	#FF393939$
 Left=����� *NetTotalCredit+$ c��  $
��Left=�$
��Auto��$	��Top=�$	��690��
������� .   .  $ 28Q�$
 None=� �	#FFCFCCCC$��16(�$��12,0,0,0q�$ IncludeHeader=����� *CurrentEmpNetCreditEntries+   $ Employee��$	 200  �� *
Employee+$ OneWay=� Z�   $ Account Number��$	 150  �� *Account.AccountNumber+$ 
Acct#: {0}�� Z�   $ Amount��$	 100 # [  �� *Total+$ c�� Z� �� $
��Left=�$
��29.6��$��37.3,13.4,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��24(����� *Institution1.Name+�� $
��Left=�$��20��$��37.3,48,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountName+�� $
��Left=�$��20��$��37.3,65.2,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountNumber+�� -     TextButtonStyle#���  $
��Left=�$��30��$��
792,25,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)�