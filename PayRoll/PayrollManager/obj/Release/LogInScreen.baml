   M S B A M L   `   `   `  ����   PayrollManager     PayrollManager.LogInScreen   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Log On�� � SizeToContent$ WidthAndHeight=� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � 
ResizeMode$ NoResize=�$	��300��$��4q� � AllowsTransparency . $��535.791��$	��304�� � 	Resources  �� 
TargetType �� Property	 �� Value��%'  '��       '�� Q     'G� v     '�� �     �� " ��.���  � ��$	 4q���  � ��$		 100����  � ��
	 �   ��� " ��.���  � ��
	 �   ��� " G�.���  � ��$	 4q���  � ��$		 100���� " ��.���  � ��$	 4q���  � ��$	 75����  � ��
	 �   ���
� .��� 
 � Color$
 	#FF404070�� � Offset$ 0Q�� $
 	#55000000��$ 1Q�.���  � RowDefinitions �� -    ��Name$ LoginRow��$	��169 ��� -   $ 
OptionsRow��$	��169 ��� -   $ UserOptionsRow��$	��169 �.+�� -    �Name$ LoginScreen�� � ColumnDefinitions �� $
��Auto ���  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� .+��� $��0��$��0��$��2��.+��� $��Stretch=�$��Center=����	#FFD3D9EE$��Normal"�$��16(�$��Calibri)�$��Log On������  �� EndPoint$ 1,0.5&� �� 
StartPoint$ 0,0.5&�.��� $
 	#FF293262��$ 0Q�� $
 	#FF5A6DCD��$	 0.4Q�� $
 	#FF5A6DCD��$	 0.6Q�� $
 	#FF293262��$ 1Q��� $��5������ $ 0.5,1&�$ 0.5,0&�.��� $
 	#FF525252��$ 0Q�� $
 	#00FFFFFF��$ 1Q��� $��0��$��1��$��Right=�$��	User Name���� -    ��Name$ 	xUsername��$��1��$��1���� $��0��$��2��$��Right=�$��Password��G� -    G�Name$ 	xPassword��$��1��$��2���� $��0��$��3��$��2��$��Center=�
�������$��Italic$�$%��Enter admin/pass as credentials��y��� *HintVisibility+�� $��0��$��4��$��2�� �� Orientation$ 
Horizontal=�$��Bottom=�$��5q�$��Right=�$
��Auto��.+��� -   $��Log-on�� �� 	IsDefault . �� $��Cancel�� �� IsCancel . � -   $ 
OptionsGrd��$��1��.+��� $��0��$��0��$��0,0,0,134.47q�.+��� $��Stretch=�$��Center=����	#FFD3D9EE$��Normal"�$��16(�$��Calibri)�$��
Next Steps������ $ 1,0.5&�$ 0,0.5&�.��� $
 	#FF293262��$ 0Q�� $
 	#FF5A6DCD��$	 0.4Q�� $
 	#FF5A6DCD��$	 0.6Q�� $
 	#FF293262��$ 1Q��� $��5������ $ 0.5,1&�$ 0.5,0&�.��� $
 	#FF525252��$ 0Q�� $
 	#00FFFFFF��$ 1Q��� -	    ��Name$ OptionsContinueBtn��$��Continue...��$
��Left=�$��30��$��
95,129,0,0q�$	��Top=�$��80��
���   ��� -
   $ UserOptionsBtn��$��User Settings��$
��Left=�$��30��$��195,128,0,0q�$	��Top=�$��80��
���   ��� -    ��Name$ 	StatusTxt��$
��Left=�$��38��$��	25,58,0,0q�$
��Wrap=�$��Welcome��$	��Top=�$	��250�� �� TextAlignment$ Center=�� -   $ UserOptionsGrd��$��4��.+��� $��Stretch=�$��Center=����	#FFD3D9EE$��Normal"�$��16(�$��Calibri)�$��User Options��$��0,0,0,139.47q����� $ 1,0.5&�$ 0,0.5&�.��� $
 	#FF293262��$ 0Q�� $
 	#FF5A6DCD��$	 0.4Q�� $
 	#FF5A6DCD��$	 0.6Q�� $
 	#FF293262��$ 1Q��� -   $ BackBtn��$
��Back��$
��Left=�$��30��$��
10,129,0,0q�$	��Top=�$��80��
���   ��� $
��Left=�$��20��$��	25,68,0,0q�$
��Wrap=�$��	User name��$	��Top=�$��75���� $
��Left=�$��20��$��
120,68,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��140������ *	LoginName+ �� UpdateSourceTrigger$ PropertyChanged=��� $
��Left=�$��20��$��	25,94,0,0q�$
��Wrap=�$	��Top=�$��75���� $�Password���� �� �� $
��Left=�$��20��$��
120,94,0,0q�$
 Wrap=�$	��Top=�$	��140������ *	SPassword+$ PropertyChanged=��� -   $ SaveBtn��$
��Save��$
��Left=�$��30��$��104,129,0,0q�$	��Top=�$��80��
���   �