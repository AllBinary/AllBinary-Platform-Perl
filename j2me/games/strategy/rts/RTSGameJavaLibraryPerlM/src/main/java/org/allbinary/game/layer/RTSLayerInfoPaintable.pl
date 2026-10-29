# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::RTSLayerInfoPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{initUpdatePaintable} = 'org::allbinary::graphics::paint::NullInitUpdatePaintable'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub update {
    my ($self) = @_;
        $self->{initUpdatePaintable}->update();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{initUpdatePaintable}->paint($graphics);
}


sub updateRTSLayerInfoInit {
    my ($self, $hudPaintable) = @_;
        $self->{initUpdatePaintable} = $hudPaintable;
}


sub updateRTSLayerInfoSelection {
    my ($self, $hudPaintable) = @_;
        $hudPaintable->updateSelectionInfo();
        $self->{initUpdatePaintable} = $hudPaintable;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::InitUpdatePaintable;
use org::allbinary::graphics::paint::NullInitUpdatePaintable;

1;

