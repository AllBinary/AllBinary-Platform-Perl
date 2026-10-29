# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::font::UpdateMyFontProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::font::MyFontProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{updateMeasurementProcessor} = undef;
}


sub new {
    my ($class, $keyValueDrawCharArray) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{updateMeasurementProcessor} = $keyValueDrawCharArray;
    return $self;
}


sub process {
    my ($self, $graphics) = @_;
        $self->{updateMeasurementProcessor}->updateMeasurement($graphics);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::font::MyFontProcessor;

1;

