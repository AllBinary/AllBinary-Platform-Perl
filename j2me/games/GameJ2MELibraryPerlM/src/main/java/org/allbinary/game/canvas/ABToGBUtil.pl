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

package org::allbinary::game::canvas::ABToGBUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::canvas::ABToGBUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{abCanvas} = $javax::microedition::lcdui::NullCanvas::NULL_CANVAS;
    $self->{allBinaryGameLayerManager} = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::canvas::ABToGBUtil::instance;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::NullCanvas;
use org::allbinary::game::layer::AllBinaryGameLayerManager;

1;

