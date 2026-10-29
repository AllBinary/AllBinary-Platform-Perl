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

package org::allbinary::input::motion::button::TouchButtonsPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{foregroundBasicColor} = undef;
    $self->{foregroundColor} = undef;
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{touchButtonFactory} = 'org::allbinary::input::motion::button::TouchButtonFactory'->getInstance();
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{foregroundBasicColor} = $basicColor;
        $self->{foregroundColor} = int($basicColor);
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        my $list = $self->{touchButtonFactory}->getList();
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->{foregroundBasicColor}, $self->{foregroundColor});
        my $touchButton = undef;
        for (my $index = $list->size(); --$index >= 0; ) {
            $touchButton = $list->{objectArray}->[$index];
            $touchButton->paint($graphics);
        }
        for (my $index = $list->size(); --$index >= 0; ) {
            $touchButton = $list->{objectArray}->[$index];
            $touchButton->paintHint($graphics);
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::input::motion::button::TouchButtonFactory;

1;

