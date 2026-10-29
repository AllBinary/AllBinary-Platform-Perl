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

package org::allbinary::input::motion::button::BasicTouchButtonCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{TOP_RIGHT} = undef;
    $self->{TOP_LEFT} = undef;
    $self->{SECOND_FROM_TOP_LEFT} = undef;
    $self->{SECOND_FROM_TOP_RIGHT} = undef;
    $self->{TOP_SECOND_FROM_LEFT} = undef;
    $self->{TOP_SECOND_FROM_RIGHT} = undef;
    $self->{BOTTOM_RIGHT} = undef;
    $self->{BOTTOM_SECOND_FROM_RIGHT} = undef;
    $self->{SECOND_FROM_BOTTOM_RIGHT} = undef;
    $self->{THIRD_FROM_BOTTOM_RIGHT} = undef;
    $self->{FOURTH_FROM_BOTTOM_RIGHT} = undef;
    $self->{SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT} = undef;
    $self->{SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT} = undef;
    $self->{SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT} = undef;
    $self->{BOTTOM_THIRD_FROM_RIGHT} = undef;
    $self->{BOTTOM_FOURTH_FROM_RIGHT} = undef;
    $self->{BOTTOM_SECOND_FROM_LEFT} = undef;
    $self->{SECOND_FROM_BOTTOM_LEFT} = undef;
    $self->{THIRD_FROM_BOTTOM_LEFT} = undef;
    $self->{BOTTOM_LEFT} = undef;
    $self->{SECOND_FROM_BOTTOM_SECOND_FROM_LEFT} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
        my $cellPositionFactory = 'org::allbinary::graphics::CellPositionFactory'->getInstance();
        $cellPositionFactory->init($touchButtonLocationHelper->getTotalColumns(), $touchButtonLocationHelper->getTotalRows());
        $self->{TOP_LEFT} = $cellPositionFactory->getInstanceColRow(0, 0);
        $self->{TOP_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, 0);
        $self->{BOTTOM_LEFT} = $cellPositionFactory->getInstanceColRow(0, $touchButtonLocationHelper->getTotalRows() - 1);
        $self->{BOTTOM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, $touchButtonLocationHelper->getTotalRows() - 1);
        $self->{BOTTOM_SECOND_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 2, $touchButtonLocationHelper->getTotalRows() - 1);
        $self->{SECOND_FROM_BOTTOM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, $touchButtonLocationHelper->getTotalRows() - 2);
        $self->{SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 2, $touchButtonLocationHelper->getTotalRows() - 2);
        $self->{BOTTOM_SECOND_FROM_LEFT} = $cellPositionFactory->getInstanceColRow(1, $touchButtonLocationHelper->getTotalRows() - 1);
        $self->{SECOND_FROM_BOTTOM_LEFT} = $cellPositionFactory->getInstanceColRow(0, $touchButtonLocationHelper->getTotalRows() - 2);
        $self->{SECOND_FROM_BOTTOM_SECOND_FROM_LEFT} = $cellPositionFactory->getInstanceColRow(1, $touchButtonLocationHelper->getTotalRows() - 2);
        if ($touchButtonLocationHelper->getTotalRows() > 2) {
            $self->{SECOND_FROM_TOP_LEFT} = $cellPositionFactory->getInstanceColRow(0, 1);
            $self->{SECOND_FROM_TOP_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, 1);
        } else {
            $self->{SECOND_FROM_TOP_LEFT} = $cellPositionFactory->{NONE};
            $self->{SECOND_FROM_TOP_RIGHT} = $cellPositionFactory->{NONE};
        }
        if ($touchButtonLocationHelper->getTotalRows() >= 4) {
            $self->{THIRD_FROM_BOTTOM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, $touchButtonLocationHelper->getTotalRows() - 3);
            $self->{FOURTH_FROM_BOTTOM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 1, $touchButtonLocationHelper->getTotalRows() - 4);
            $self->{THIRD_FROM_BOTTOM_LEFT} = $cellPositionFactory->getInstanceColRow(0, $touchButtonLocationHelper->getTotalRows() - 3);
        } else {
            $self->{THIRD_FROM_BOTTOM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{FOURTH_FROM_BOTTOM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{THIRD_FROM_BOTTOM_LEFT} = $cellPositionFactory->{NONE};
        }
        if ($touchButtonLocationHelper->getTotalColumns() >= 4) {
            $self->{SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 3, $touchButtonLocationHelper->getTotalRows() - 2);
            $self->{SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 4, $touchButtonLocationHelper->getTotalRows() - 2);
            $self->{BOTTOM_THIRD_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 3, $touchButtonLocationHelper->getTotalRows() - 1);
            $self->{BOTTOM_FOURTH_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 4, $touchButtonLocationHelper->getTotalRows() - 1);
            $self->{TOP_SECOND_FROM_LEFT} = $cellPositionFactory->getInstanceColRow(1, 0);
            $self->{TOP_SECOND_FROM_RIGHT} = $cellPositionFactory->getInstanceColRow($touchButtonLocationHelper->getTotalColumns() - 2, 0);
        } else {
            $self->{SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{BOTTOM_THIRD_FROM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{BOTTOM_FOURTH_FROM_RIGHT} = $cellPositionFactory->{NONE};
            $self->{TOP_SECOND_FROM_LEFT} = $cellPositionFactory->{NONE};
            $self->{TOP_SECOND_FROM_RIGHT} = $cellPositionFactory->{NONE};
        }
    return $self;
}

use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;

1;

