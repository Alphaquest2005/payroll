   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  &     PayrollManager.PayrollSetupItems   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
Converters'clr-namespace:PayrollManager.Converters       � 	Resources  +   %PayrollManager.PayrollSetupItemsModel $   PayrollSetupItemsModelDataSource,   &PayrollManager.PayrollItemDetailsModel % !PayrollItemDetailsModelDataSource;   5PayrollManager.Converters.EnumMatchToBooleanConverter  EnumConverter��%-   &	        &	      &	 
           .��� -    �Name$ 
LayoutRoot�� � DataContext ��  �� Source# [  .+�� -   $ LayoutRoot_Copy��$��0,77.884,0,2.116q����	#33FFFFFF �� *CurrentPayrollSetupItem+ � ColumnDefinitions �� $	��15* ��� $	��17* �.+��� $��29.894,23.348,0,0q�$
��Left=�$	��Top=�$��33.403��$��248.93��$��21.333(����� *Name+ �� FallbackValue$ Please add new Item�� �� UpdateSourceTrigger$ PropertyChanged=��� $��101,121,0,0q�$
��Left=�$	��Top=�$��23��$��95������ *
Priority+�� $
��Left=�$��22��$��
18,121,0,0q�$
��Wrap=�$��Priority��$	��Top=�$��72�� �� TextAlignment$ Right=�	�  	� 	GroupName$ ItemType��$��	20,23,0,0q�$
��Left=�$	��Top=�$��21��$��74��$��Income��$��1��	 d� 	IsChecked	 �� *IncomeDeduction+
 �� ConverterParameter$

 True�� �� 	Converter# [  �� Mode$ TwoWay=�$ PropertyChanged=�	� $ ItemType��$��	20,65,0,0q�$
��Left=�$	��Top=�$��21��$��74��$��	Deduction��$��1��	 �� *IncomeDeduction+$
 False��# [ $ TwoWay=�$ PropertyChanged=���  �� DisplayMemberPath$ AccountTypeName�� �� SelectedValuePath$ AccountTypeName��$��111,155,0,0q�$
��Left=�$	��Top=�$��22��$	��191��$��1�� �� Text �� *EmployeeAccountType+$ PropertyChanged=����� *AccountTypes+# [  �� $
��Left=�$��35��$��
20,149,0,0q�$
��Wrap=�$��Employee Account Type��$	��Top=�$��86��$��1��$ Right=��� -    ��Name$ SaveBtn��$��1��$
��Left=�$��38.793��$��89.668,334.279,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�  TextButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$��1��$
��Left=�$��38.793��$��288.374,334.279,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�  CloseButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$��1��$
��Left=�$��38.793��$��48.855,334.279,0,0q�$
��Wrap=�$	��Top=�$��34.776��$ Center=�#���  $��26.667(�$	����$��Segoe UI Symbol)��� $��110.898,203,0,0q�$
��Left=�$	��Top=�$��1��$��25��$��97��$y�Hidden=����� *RecuranceDays+$ PropertyChanged=��� $
��Left=�$��35��$��19.898,203,0,0q�$
��Wrap=�$��Recurrence in Days��$	��Top=�$��86��$��1��$ Right=�$y�Hidden=��� $ AccountName��$ 	AccountId��$��111,115,0,0q�$
��Left=�$	��Top=�$��22��$	��191��$��1�� �� SelectedValue �� *PayrollItemAccountId+$ PropertyChanged=����� *InstitutionAccountsList+# [  �� $
��Left=�$��35��$��
20,109,0,0q�$
��Wrap=�$��Job Item Account��$	��Top=�$��86��$��1��$ Right=��� $ AccountName��$ 	AccountId��$��101,161,0,0q�$
��Left=�$	��Top=�$��22��$	��191�� �� *CompanyAccountId+$ PropertyChanged=����� *InstitutionAccountsList+# [  �� $
��Left=�$��35��$��
10,155,0,0q�$
��Wrap=�$��Company Account��$	��Top=�$��86��$ Right=��� $��101,195,0,0q�$
��Left=�$	��Top=�$��25��$	��189��$��14(����� *CompanyLineItemDescription+$ Please add new Item��$ PropertyChanged=��� $
��Left=�$��35��$��
10,189,0,0q�$
��Wrap=�$��Company Description��$	��Top=�$��86��$ Right=��� $ Content��$��111,195,0,0q�$
��Left=�$	��Top=�$��22��$	��146��$��1�� �� *RateRounding+$ PropertyChanged=�.@��� -    ��Name$
 cbi1��$��Up���� $
��Left=�$��23��$��
29,194,0,0q�$
��Wrap=�$��Rate Rounding��$	��Top=�$��81��$��1���� $��113,244,0,0q�$
��Left=�$	��Top=�$��23��$��95������ *Amount+ �� StringFormat$ c��$ PropertyChanged=��� $
��Left=�$��22��$��
30,244,0,0q�$
��Wrap=�$��Amount��$	��Top=�$��72��$ Right=��� $��113,313,0,0q�$
��Left=�$	��Top=�$��23��$��95������ *MiniumBaseAmount+$ c��$ PropertyChanged=��� $
��Left=�$��34��$��
16,307,0,0q�$
��Wrap=�$	��Top=�$��86��$ Right=��� $�Minimum ���� �� $�Base Amount ���� $��113,346,0,0q�$
��Left=�$	��Top=�$��22��$��95������ *AmountFlooring+$ c��$ PropertyChanged=��� $
��Left=�$��35��$��
30,340,0,0q�$
��Wrap=�$��Amount Flooring��$	��Top=�$��72��$ Right=��� $��
11,242,0,0q�$
��Left=�$	��Top=�$��23��$��95��$��1������ *Rate+$
 0.00��$ PropertyChanged=��� $
��Left=�$��23��$��228,242,0,0q�$
��Wrap=�$
��Rate��$	��Top=�$��72��$ Right=��� $��209,242,0,0q�$
��Left=�$	��Top=�$��23��$��95��$��1������ *RateCeiling+$ c��$ PropertyChanged=��� $
��Left=�$��23��$��126,242,0,0q�$
��Wrap=�$��Rate Ceiling��$	��Top=�$��72��$ Right=�$��1���� $��	9,306,0,0q�$
��Left=�$	��Top=�$��23��$��96��$��1������ *RateCeilingAmount+$ c��$ PropertyChanged=��� $
��Left=�$��34��$��217,306,0,0q�$
��Wrap=�$��Rate Ceiling Amount��$	��Top=�$��88��$ Right=�$��2���� $��209,276,0,0q�$
��Left=�$	��Top=�$��22��$��95��$��1������ *RateCeilingCompanyAmount+$ c��$ PropertyChanged=��� $
��Left=�$��56��$��111,273,0,0q�$
��Wrap=�$!��Rate Ceiling Company Amount��$	��Top=�$��87��$ Right=�$��1���� $��
11,273,0,0q�$
��Left=�$	��Top=�$��23��$��95��$��1������ *CompanyRate+$
 0.00��$ PropertyChanged=��� $
��Left=�$��23��$��217,273,0,0q�$
��Wrap=�$��Company Rate��$	��Top=�$��83��$ Right=��� $��112,276,0,0q�$
��Left=�$	��Top=�$��23��$��95������ *CompanyAmount+$ c��$ PropertyChanged=��� $
��Left=�$��31��$��
10,272,0,0q�$
��Wrap=�$��Company Amount��$	��Top=�$��91��$ Right=��� $
��Left=�$��20��$��
111,24,0,0q�$	��Top=�$	��142��$��Is Taxable Benefit��$��1��	 �� *IsTaxableBenefit+$ PropertyChanged=��� $
��Left=�$��20��$��
111,65,0,0q�$	��Top=�$	��142��$��Apply To Taxable Benefits��$��1��	 �� *ApplyToTaxableBenefits+$ PropertyChanged=��� $
��Left=�$��47��$��28.149,10,0,0q�$
��Wrap=�$��Payroll Setup Items��$	��Top=�$	��277��$��24(�