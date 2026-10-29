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

package org::allbinary::game::displayable::canvas::BaseMenuBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::displayable::canvas::BaseMenuBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::BaseMenuBehavior::instance;
}


# throws Exception
sub onDisplayChangeEvent {
    my ($self, $allBinaryGameCanvas, $displayChangeEvent) = @_;
}


sub initSpecialPaint {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->setNonBotPaintableP('org::allbinary::graphics::paint::NullPaintable'->getInstance());
}


# throws Exception
sub initMenu {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub updateMenu {
    my ($self, $allBinaryGameCanvas) = @_;
}


# throws Exception
sub popupMenu {
    my ($self, $allBinaryGameCanvas) = @_;
}


sub closeMenu {
    my ($self, $allBinaryGameCanvas) = @_;
}

use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::paint::NullPaintable;

1;

