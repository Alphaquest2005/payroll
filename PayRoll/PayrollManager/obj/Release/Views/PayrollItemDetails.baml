   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  '    !PayrollManager.PayrollItemDetails   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
converters'clr-namespace:PayrollManager.Converters     c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bei9http://schemas.microsoft.com/expression/2010/interactions    � 	Resources  ,   &PayrollManager.PayrollItemDetailsModel %  !PayrollItemDetailsModelDataSource;   5PayrollManager.Converters.EnumMatchToBooleanConverter  EnumConverter6   0PayrollManager.Converters.DisablePostedConverter  PostedConverter��%-   &	        &	      &	 
           .��� $��4.364,0.436,-4.364,-0.436q� � DataContext ��  �� Source# [  .+�� -    �Name$ 
LayoutRoot��$��0,80,0,-0.2q����	#33FFFFFF �� # [   �� Path$ CurrentPayrollItem�{��� # [  $ CurrentPayrollJob.Status� �� 	Converter# [  � ColumnDefinitions �� $	��15* ��� $	��17* �.+���  �� DisplayMemberPath$ DisplayName�� �� SelectedValuePath$ 
EmployeeId��$��143.77,23.348,0,0q�$
��Left=�$	��Top=�$��23.816��$��185.759��	 J� RenderTransformOrigin$	 0.501,0.554&�$��1��
 �� SelectedValue
 �� *
EmployeeId+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=����� *	Employees+# [  �� $��29.894,23.348,0,0q�$
��Left=�$	��Top=�$��33.403��$��248.93��$��21.333(����� *Name+ �� FallbackValue$ Create New Item��$ PropertyChanged=��� $
��Left=�$��22.07��$��57.161,25.094,0,0q�$
��Wrap=�$��Employee��$	��Top=�$��72.445�� �� TextAlignment$ Right=�$��1���� $
 Name��$ PayrollJobId��$��143.77,64.371,0,0q�$
��Left=�$	��Top=�$��25.561��$��185.759��$��1��
 �� *PayrollJobId+$ PropertyChanged=����� *PayrollJobs+# [  �� $
��Left=�$��34.277��$��56.07,59.801,0,0q�$
��Wrap=�$��Assigned Payroll Job��$	��Top=�$��72.445��$ Right=�$��1���� $��138.777,127.65,0,0q�$
��Left=�$	��Top=�$��22.741��$��95.207������ *
Priority+$ PropertyChanged=��� $
��Left=�$��22.07��$��55.641,127.65,0,0q�$
��Wrap=�$��Priority��$	��Top=�$��72.445��$ Right=��� $��138.777,156.461,0,0q�$
��Left=�$	��Top=�$��21.763��$��95.207������ *Rate+ �� StringFormat$
 0.00��$ PropertyChanged=��� $
��Left=�$��22.07��$��55.641,156.461,0,0q�$
��Wrap=�$
��Rate��$	��Top=�$��72.445��$ Right=�	�  	� 	GroupName$ ItemType��$��48.223,75.154,0,0q�$
��Left=�$	��Top=�$��21.106��$��74.039��$��Income�� d� 	IsChecked �� *IncomeDeduction+$ TwoWay=�# [  �� ConverterParameter$
 True��$ PropertyChanged=�	� $ ItemType��$��159.945,75.154,0,0q�$
��Left=�$	��Top=�$��21.106��$��74.039��$��	Deduction�� �� *IncomeDeduction+$ TwoWay=�# [ $ False��$ PropertyChanged=��� $ AccountName��$ 	AccountId��$��19.465,150.78,0,0q�$
��Left=�$	��Top=�$��22.07��$��145.973��$��1��
 �� *DebitAccountId+$ PropertyChanged=����� *CurrentAccountsLst+# [  �� $
��Left=�$��22.07��$��19.465,127.214,0,0q�$
��Wrap=�$��Debit Account��$	��Top=�$��85.537��$��1���� $ AccountName��$ 	AccountId��$��181,149,0,0q�$
��Left=�$	��Top=�$��22��$	��146��$��1��
 �� *CreditAccountId+$ PropertyChanged=����� *CurrentAccountsLst+# [  �� $
��Left=�$��22.07��$��183.556,127.65,0,0q�$
��Wrap=�$��Credit Account��$	��Top=�$��85.537��$��1���� {�.  $��138.777,183.819,0,0q�$
��Left=�$	��Top=�$��24.694��$��95.207������ *
BaseAmount+$ c��$ OneWay=�$ PropertyChanged=��� $��138.777,213.64,0,0q�$
��Left=�$	��Top=�$��20.788��$��95.207������ *Amount+$ c��$ PropertyChanged=��� $
��Left=�$��22.07��$��55.641,183.819,0,0q�$
��Wrap=�$	��Top=�$��72.445��$ Right=��� $�Base Amount���� �� �� $
��Left=�$��22.07��$��55.641,213.64,0,0q�$
��Wrap=�$	��Top=�$��72.445��$ Right=��� $�Amount���� �� �� -    ��Name$ SaveBtn��$��1��$
��Left=�$��38.793��$��96.518,225.22,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�  TextButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$��1��$
��Left=�$��38.793��$��295.224,225.22,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�  CloseButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$��1��$
��Left=�$��38.793��$��55.705,225.22,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�#���  $��26.667(�$	����$��Segoe UI Symbol)��� $��139,249,0,0q�$
��Left=�$	��Top=�$��22��$	��146�� �� Text �� *RateRounding+$ PropertyChanged=�.@��� -   $
��cbi1��.��Up�� $
��Left=�$��23��$��
42,248,0,0q�$
��Wrap=�$��Rate Rounding��$	��Top=�$��86���� $
��Left=�$��20��$��
23,184,0,0q�$	��Top=�$	��122��$��Is Taxable Benefit��$��1�� �� *IsTaxableBenefit+$ PropertyChanged=��� $
��Left=�$��22��$��169,184,0,0q�$	��Top=�$	��163��$��Apply To Taxable Benefits��$��1�� �� *ApplyToTaxableBenefits+$ PropertyChanged=��� $
��Left=�$��46.952��$��28.149,10,0,0q�$
��Wrap=�$��Create/Edit Payroll Item��$	��Top=�$��276.686��$��24(�