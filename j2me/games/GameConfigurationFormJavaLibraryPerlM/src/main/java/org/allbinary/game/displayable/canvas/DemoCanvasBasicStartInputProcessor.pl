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

package org::allbinary::game::displayable::canvas::DemoCanvasBasicStartInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::BasicMenuInputProcessor';



sub new {
    my ($class, $gameKeyEventList, $gameCanvas) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, -1, $gameCanvas);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processInputList {
    my ($self) = @_;
        my $list = $self->getGameKeyEventList();
        my $size = $list->size();
        my $gameKeyEvent = undef;
        for (my $index = 0; $index < $size; $index++) {
            $gameKeyEvent = $list->{objectArray}->[$index];
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Start GameKey: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($gameKeyEvent))->toString(), $self, 'org::allbinary::game::input::GameInputStrings'->getInstance()->{PROCESS_INPUT});
        }
        $self->getCanvas()->getCustomCommandListener()->commandAction('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{START_COMMAND}, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
        return $size;
}

# use javax::microedition::lcdui::NullCanvas;
use org::allbinary::canvas::RunnableCanvas;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::BasicMenuInputProcessor;

1;

