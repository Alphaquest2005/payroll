   M S B A M L   `   `   `  ����   SUT.PrintEngine,    &SUT.PrintEngine.Views.PrintControlView   R NWindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    8x,http://schemas.microsoft.com/winfx/2006/xaml    >d2http://schemas.microsoft.com/expression/blend/2008    Hmc;http://schemas.openxmlformats.org/markup-compatibility/2006    $��0q�$��Stretch=�$��Stretch=�$	��700��$	��500�����	#FFEBEBEB  � 	Resources      BooleanToVisibilityConverter��%   &	        �� .���� $��15q�._��  � ColumnDefinitions �� $��* � � RowDefinitions �� $��* ��� $
��Auto �.+�� -    �Name$ MainPane��$��0�� �� $��* � �� $��* ��� $
��Auto �.+��� -    ��Name$ TopPane��$��0��$��0��$��1q����#949494._��  �� $
��Auto ��� $��* �.+��� -   $ ToolBar��$��35�����	#FFA8A8A8$��2q�._�]� ��.  .+��� -    ��Name$ ActualSizeButton��$��Right=���. $��5�� � ToolTip$
 100%��$��Center=�$��75�� ^� ShowOnDisabled . $��Actual Size��$��0,0,5,0q�  DefaultButtonStyle#���  $��25������ *ActualPageSizeCommand+�� -   $ AllPagesButton��$��Right=���. $��8��$ Show All Pages��$��Center=�$��75�� . $��Stretch=�$��	All Pages��$��0,0,5,0q�#���  $��25������ *AllPagesCommand+o�  � Cursor$
 Hand��$��Right=�$��0,0,5,0q�$��Center=�$��25����Z� .@�m� $��Printing Options��$��Center=�  MenuItemStyle#���  $��25��$��108.893��.@�m� #���  ��C� *�� 	 �� 
ResourceId$	 SubmenuItemTemplateKey��
 �� TypeInTargetAssembly"
 m�+��� .+��� -   $  PrintingOptionsWaitCurtain�� K� ZIndex$ 1��$
��Auto��
������� J� Opacity$	 0.9Q�$y�	Collapsed=�._��� $��Please Wait...��$��Center=�$��Center=�
���  ��$��14.667(��� $
��Auto��$
��Auto��$��1,0,1,1q����#ffffff$��0,0,0,0q�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFE8E7E7�� � Offset$ 1Q�� $ 	#FFFFFFFF��$ 0Q�� $ 	#FFFFFDFD��$	 0.5Q� J� BitmapEffect F�  F� Noise$
 0.09Q� F� Color$ 	#FF474242�� F� ShadowDepth$ 2Q�._���  �� Orientation$ Vertical=�$��5q�.+��� $ Vertical=�$
��Auto��$��Stretch=�$��Center=�.+��� $��0,0,0,2q�$��Verdana)�
���   �$
��Bold"�$��10(�$��0,0,0,0q�$
��Left=�$��
Paper Size���� $ 
Horizontal=�.+��� -    ��Name$ 	PaperType��$	��150��$��0,5,0,2q�$
��Left=�����  �� Path$ CurrentPaper.PaperName� �� Mode$ TwoWay=��� $��Change��$
 Hand��#���  $��60������ *ChangePaperCommand+�� $��1�����	#FFDADBDC$��0,10,0,0q��� $��1�����	#FFEBEDED$��0,0,0,5q��� $ Vertical=�$��Stretch=�.+��� $��0,0,0,2q�$��Verdana)�
���   �$
��Bold"�$��10(�$��0,0,0,0q�$��Stretch=�$��Orientation���� $ 
Horizontal=�.+�	� -    	�Name$ Portrait��$
 Hand�� 	� 	GroupName$ PreviewPageOrientation��$��Portrait��$��9(�$��0,2,10,0q� d� 	IsChecked$
 TrueY�$��Portrait������ $ PageOrientationCommand�	� -	   $ 	Landscape��$
 Hand��$ PreviewPageOrientation��$��	Landscape��$��9(�$��	20,2,20,0q�$��	Landscape������ $ PageOrientationCommand��� ���	#FFCFD8DA$��0��$��0,10,0,0q�$	��Top=�$��1���� $��1�����#eeeeee$��0,0,0,10q��� $��0,-1,2,0q�$��1q����#cccccc �� CornerRadius$ 0,5,5,5�����#FFFDDB._��� $ Vertical=�$��8,0,0,0q�.+��� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��0,0,0,2q�$��Verdana)�
���   �$
��Bold"�$��10(�$��0,15,0,0q�$
��Left=�$��Select Printer���� $ 
Horizontal=�.+��� -
    ��Name$ PrinterList��$
 Hand��$��0,5,0,0q�$	��150��$
��Left=� �� SelectedValuePath$ FullName�� �� DisplayMemberPath$ FullName������ *
Printers+  �� SelectedItem  �� *CurrentPrinter+$ TwoWay=��� $
 Hand��$��0,5,0,0q�$
��Left=�$��Error��$y�Hidden=�]� ��.  $��0,0,0,15q�.+��� $
��Left=�$ Vertical=�.+��� $��0,0,0,2q�$��Verdana)�
���   �$
��Bold"�$��10(�$��0,10,0,0q�$
��Left=�$��Copies���� $��25��$��0,5,0,0q�$
��Left=�$��20������ *PrintCopyCount+$ TwoWay=�! �� UpdateSourceTrigger$! PropertyChanged=��� $y�	Collapsed=�$ Vertical=�$��5,0,30,0q�$��Right=�.+��� $��0,0,0,2q�$��Verdana)�
���   �$
��Bold"�$��10(�$��0,10,0,0q�$
��Left=�$��Range���� $ 
Horizontal=�$��0,5,0,0q�.+��� $��25��$��18������ *PageRangeStart+$ TwoWay=�$! PropertyChanged=��� $��0,0,0,2q�$��Verdana)�
���   �$��10(�$��5,5,0,0q�$
��Left=�$��to���� $��25��$��5,0,0,0q�$��18������ *PageRangeEnd+$ TwoWay=�$! PropertyChanged=��� -   " ��Name$" PageNumberMarker��$
 Hand��$y�	Collapsed=�$��	0,0,10,10q� �� *IsMarkPageNumbers+$ TwoWay=�.���� $��3,0,0,0q�$��9(�
���   �$��0,0,0,0q�$��Mark Page Positions��$
��Bold"��� ���#cfd8da$��0��$��0,10,0,0q�$	��Top=�$��1���� ���#ffffff$��0��$��0,0,0,0q�$	��Top=�$��1��]� ��.  $��0,10,0,0q�.+��� -   $ CancelSetButton��$
 Hand��$
��Left=�$��Cancel��#���  $��60������ $" CancelPrintingOptionsCommand��� -   # ��Name$# SetPanel��$��Right=�.+��� -   $ 	SetButton��$
 Hand��$	��Set��#���  $��60������ $ SetPrintingOptionsCommand�o� -   $ o�Name$$ 	ScaleMenu��$
 Hand��$��Right=�$��0,0,5,0q�$��Center=�$��25��$��60��y��� *
CanScale+% �� 	Converter#% [  ��Z� .@�m� $��
Print Size��$��25��$��60��.@�m� #���  ��C� *�� $	 SubmenuItemTemplateKey��"
 m�+���� $
��Auto��$
��Auto��$��1,0,1,1q����#ffffff$��0,0,0,0q����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFE8E7E7��$ 1Q�� $ 	#FFFFFFFF��$ 0Q�� $ 	#FFFFFDFD��$	 0.5Q� F� $
 0.09Q�$ 	#FF474242��$ 2Q�._��� $ Vertical=�$��5q�$��Center=�$��Center=�.+��� $ Vertical=�$	��200��$��0,5,0,5q�y��� $ ScaleSliderVisibility�.+��  �� $
��Auto ��� $��* ��� $
��Auto � �� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $ Vertical=�$��0��$��0��.+��� $��0,0,0,0q�$��Verdana)�
���   �$��9(�$
��Bold"�$��0,0,0,0q�$
��Left=�$��Small���� $��0,0,0,0q�$��Verdana)����#666666$��9(�$��0,0,0,0q�$
��Left=�$��
Less pages���� $ Vertical=�$��2��$��0��.+��� $��0,0,0,0q�$��Verdana)�
���   �$��9(�$
��Bold"�$��0,0,0,0q�$��Right=�$	��Big���� $��0,0,0,0q�$��Verdana)����#666666$��9(�$��0,0,0,0q�$��Right=�$��
More pages���� -   & ��Name$& PageNumbersSlider��$
 Hand��$��0,5,0,0q�' � Minimum$	' 0.1Q�( � Maximum$( 1Q�) � Value) �� $ Scale�$ TwoWay=�� -   $ ScalePreviewBox��$	��200��$	��100��
�������$ 1Q�.+��� $��1q����#cccccc._�]� .+�� -   $ PreviewNode��$��90��$��51��$��Center=�$��Center=�.+�� $��90��$��51��.+��� ���	#FFE4FFAE���#cccccc�� $��Content��$��Center=�$��Center=�$��Arial)�$��14(�
���   ��� ���#cfd8da$��0��$��0,10,0,0q�$	��Top=�$��1���� ���#ffffff$��0��$��0,0,0,0q�$	��Top=�$��1��]� ��.  $��0,10,0,0q�.+��� $
 Hand��$
��Left=�{�.  $��Cancel��#���  $��60������ $ CancelScaleCommand��� $
 Hand��$��Right=�$��Apply��#���  $��60������ $ ApplyScaleCommand��� -   * ��Name$* sv��!+ �� IsDeferredScrollingEnabled+ .  $��1����. $
��Auto=�$
��Auto=�.���� 
�������$��Stretch=�$��Stretch=�$��2,0,2,2q����	#FFEBEBEB._��� -   $# PagePreviewContainer��
���������.  $ Vertical=�$��Center=�$��Center=�� -   $ 
ButtonPane��$��1��.+��� $
��Left=�$��Center=�$ 
Horizontal=�$��10q�.+��� $��
Requires :��$��12(����	#FF181313�� -   $ 
PageNumber��$��12(����	#FF430000���� $ ApproaxNumberOfPages��� -   $ PageName��$��12(����	#FF181313���� $ CurrentPaper.PaperName��� $��pages��$��12(����	#FF181313�� $��in��$��12(����	#FF181313�� -   $ Orientation��$��12(����	#FF430000���� $ PageOrientationString��� $��at printer : ��$��12(����	#FF181313�� -   , ��Name$, PrinterName��$��CharacterEllipsis=�$	��220��$��Center=�- �� Padding$- 0q�$��12(����	#FF430000$��10������ $ CurrentPrinterName�$ OneWay=� �� $ CurrentPrinterName�$ OneWay=��� $��Right=�$ 
Horizontal=�$��10q�.+��� $��Right=�$��Cancel��#���  $��60������ $ CancelPrintCommand��� $
��10,0q�$��Or��$��Center=��� . �� 	IsDefault. . $��Right=�$��Print��#���  $��60������ $ PrintDocumentCommand�