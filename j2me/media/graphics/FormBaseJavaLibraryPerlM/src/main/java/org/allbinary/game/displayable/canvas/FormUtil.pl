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

package org::allbinary::game::displayable::canvas::FormUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::displayable::canvas::FormUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::FormUtil::instance;
}


sub createFormRectangle {
    my ($self) = @_;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $rectangle = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY(30, 10), $displayInfo->getLastWidth() - 30, $displayInfo->getLastHeight() - 35);
        return $rectangle;
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::logic::communication::log::LogUtil;

1;

