#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::game::layer::PaintableLayerComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{paintableArray} = undef;
}


sub new {
    my ($class, $paintableArray) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{paintableArray} = $paintableArray;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        for (my $index = scalar(@{$self->{paintableArray}}); --$index >= 0; ) {
            $self->{paintableArray}->[$index]->paint($graphics);
        }
}


sub paintThreed {
    my ($self, $graphics) = @_;
        my $paintableInterface = undef;
        for (my $index = scalar(@{$self->{paintableArray}}); --$index >= 0; ) {
            $paintableInterface = $self->{paintableArray}->[$index];
            $paintableInterface->paintThreed($graphics);
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::Layer;

1;

