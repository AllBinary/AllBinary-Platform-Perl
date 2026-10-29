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

package org::allbinary::game::layer::PlayerGameInputGameLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AllBinaryGameLayer','org::allbinary::game::input::PlayerGameInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{playerGameInput} = undef;
}


sub new {
    my ($class, $playerInputId) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 0, 0), 'org::allbinary::view::StaticViewPosition'->new(0, 0, 0));
    $self->_init_fields();
        # super(...) made $self above
        $self->{playerGameInput} = 'org::allbinary::game::input::PlayerGameInput'->new($self->getGameKeyEventList(), 'org::allbinary::util::BasicArrayListD'->new(), $playerInputId);
        my $canvasStrings = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
        $self->{logUtil}->putF("Danger Danger Danger: Should Not Be Called Except For Testing Input", $self, $canvasStrings->{PAINT});
    return $self;
}


sub getPlayerGameInput {
    my ($self) = @_;
        return $self->{playerGameInput};
}


sub initInputProcessors {
    my ($self) = @_;
}


# throws Exception
sub processInput {
    my ($self, $myManager) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::PlayerGameInputCompositeInterface;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::view::StaticViewPosition;
use org::allbinary::game::layer::AllBinaryGameLayer;

1;

