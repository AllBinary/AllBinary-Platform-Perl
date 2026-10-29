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

package org::allbinary::game::displayable::canvas::InGameMenuBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::BaseMenuBehavior';

our $instanceC = 'org::allbinary::game::displayable::canvas::InGameMenuBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::InGameMenuBehavior::instanceC;
}


# throws Exception
sub onDisplayChangeEvent {
    my ($self, $allBinaryGameCanvas, $displayChangeEvent) = @_;
        $allBinaryGameCanvas->updateMenuFromEvent($displayChangeEvent);
}


sub initSpecialPaint {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->setNonBotPaintableP('org::allbinary::game::displayable::canvas::GameCanvasNonBotPaintable'->new($allBinaryGameCanvas));
}


# throws Exception
sub initMenu {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->initMenu2();
}


# throws Exception
sub updateMenu {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->initMenu2();
}


# throws Exception
sub popupMenu {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->popupMenu2();
}


sub closeMenu {
    my ($self, $allBinaryGameCanvas) = @_;
        $allBinaryGameCanvas->closeMenu2();
}

use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::game::displayable::canvas::BaseMenuBehavior;
use org::allbinary::game::displayable::canvas::GameCanvasNonBotPaintable;

1;

