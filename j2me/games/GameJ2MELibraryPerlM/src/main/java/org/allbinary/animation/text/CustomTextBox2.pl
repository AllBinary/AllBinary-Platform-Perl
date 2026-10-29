# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package org::allbinary::animation::text::CustomTextBox2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::CustomTextBox';



sub new {
    my ($class, $cmdListener, $label, $text, $maxSize, $constraints, $font, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($cmdListener, $label, $text, $maxSize, $constraints, $font, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
        $self->getTextFieldItem()->setFocus(1);
    return $self;
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::CustomTextBox;

1;

