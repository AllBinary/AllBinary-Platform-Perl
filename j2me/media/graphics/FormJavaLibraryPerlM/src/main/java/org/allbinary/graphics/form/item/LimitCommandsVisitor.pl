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

package org::allbinary::graphics::form::item::LimitCommandsVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::Visitor';


sub _init_fields {
    my ($self) = @_;
    $self->{isNotSmallDisplay} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{isNotSmallDisplay} = ($displayInfo->isPortrait() && $displayInfo->getLastHeight() > 'org::allbinary::graphics::form::ScreenInfo'->getInstance()->{SMALL_WIDTH}) || (!$displayInfo->isPortrait() && $displayInfo->getLastHeight() > 'org::allbinary::graphics::form::ScreenInfo'->getInstance()->{SMALL_HEIGHT});
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        my $command = $anyType;
        my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
        if ($self->{isNotSmallDisplay} || $command->getPriority() == 1 || $command == 'org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{EXIT_COMMAND} || $command == 'org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{EXIT_WITHOUT_PROGRESS_COMMAND}) {
            return $booleanFactory->{TRUE};
        } else {
            return $booleanFactory->{FALSE};
        }
}

# use javax::microedition::lcdui::Command;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::form::ScreenInfo;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::util::visitor::Visitor;

1;

