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

package org::allbinary::game::displayable::canvas::PopupCommandFormInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::CommandFormInputProcessor';



sub new {
    my ($class, $gameKeyEventList, $playerInputId, $gameCanvas, $form, $popupMenuInputProcessor) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, $playerInputId, $gameCanvas, $form);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processInput {
    my ($self, $key) = @_;
        return $self->SUPER::processInput($key);
}


# throws Exception
sub processMotionInput {
    my ($self, $motionGestureEvent) = @_;
        $self->SUPER::processMotionInput($motionGestureEvent);
}

use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::displayable::canvas::CommandFormInputProcessor;

1;

