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

package org::allbinary::direction::DirectionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::direction::DirectionFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "DIRECTION";
    $self->{LEFT} = 'org::allbinary::direction::Direction'->new('org::allbinary::string::CommonPhoneStrings'->getInstance()->{LEFT}, "WEST", 0, 1);
    $self->{RIGHT} = 'org::allbinary::direction::Direction'->new('org::allbinary::string::CommonPhoneStrings'->getInstance()->{RIGHT}, "EAST", 1, 0);
    $self->{DOWN} = 'org::allbinary::direction::Direction'->new('org::allbinary::string::CommonPhoneStrings'->getInstance()->{DOWN}, "SOUTH", 2, 0);
    $self->{UP} = 'org::allbinary::direction::Direction'->new('org::allbinary::string::CommonPhoneStrings'->getInstance()->{UP}, "NORTH", 3, 0);
    $self->{UP_LEFT} = undef;
    $self->{UP_RIGHT} = undef;
    $self->{DOWN_LEFT} = undef;
    $self->{DOWN_RIGHT} = undef;
    $self->{NOT_BORDERED_WITH} = 'org::allbinary::direction::Direction'->new("NOT_BORDERED_WITH", "NOT_BORDERED_WITH", 8, 0);
    $self->{NO_DIRECTION} = 'org::allbinary::direction::Direction'->new("NO_DIRECTION", "NO_DIRECTION", 9, 0);
    $self->{TOP} = 'org::allbinary::direction::Direction'->new("TOP", "TOP", 10, 0);
    $self->{BOTTOM} = 'org::allbinary::direction::Direction'->new("BOTTOM", "BOTTOM", 11, 0);
    $self->{ALL_DIRECTION} = 'org::allbinary::direction::Direction'->new("ALL_DIRECTION", "ALL_DIRECTION", 12, 0);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::direction::DirectionFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->{UP_LEFT} = 'org::allbinary::direction::Direction'->new("UP LEFT", $stringBuffer->append($self->{UP}->getOtherName())->append($commonSeps->{SPACE})->append($self->{LEFT}->getOtherName())->toString(), 4, 0);
        $stringBuffer->delete(0, $stringBuffer->length());
        $self->{UP_RIGHT} = 'org::allbinary::direction::Direction'->new("UP RIGHT", $stringBuffer->append($self->{UP}->getOtherName())->append($commonSeps->{SPACE})->append($self->{RIGHT}->getOtherName())->toString(), 5, 0);
        $stringBuffer->delete(0, $stringBuffer->length());
        $self->{DOWN_LEFT} = 'org::allbinary::direction::Direction'->new("DOWN LEFT", $stringBuffer->append($self->{DOWN}->getOtherName())->append($commonSeps->{SPACE})->append($self->{LEFT}->getOtherName())->toString(), 6, 0);
        $stringBuffer->delete(0, $stringBuffer->length());
        $self->{DOWN_RIGHT} = 'org::allbinary::direction::Direction'->new("DOWN RIGHT", $stringBuffer->append($self->{DOWN}->getOtherName())->append($commonSeps->{SPACE})->append($self->{RIGHT}->getOtherName())->toString(), 7, 0);
    return $self;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::direction::Direction;

1;

