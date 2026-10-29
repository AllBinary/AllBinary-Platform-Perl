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

package org::allbinary::input::motion::button::CommonButtons;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::input::motion::button::CommonButtons'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{STANDARD_BUTTON_SIZE} = undef;
    $self->{NORMAL_BUTTON} = undef;
    $self->{LARGE_BUTTON} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::CommonButtons::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $commonButtonSize = 128;
        while ($commonButtonSize > 64) {
            my $totalColumns = $displayInfo->getLastWidth() / $commonButtonSize;
            my $totalRows = $displayInfo->getLastHeight() / $commonButtonSize;
            my $max = $totalColumns;
            if ($totalRows > $max) {
                $max = $totalRows;
            }
            if ($max > 9) {
                last;
            }
            $commonButtonSize = POSIX::floor(($commonButtonSize) / (2 ** (1)));
        }
        $self->{STANDARD_BUTTON_SIZE} = $commonButtonSize;
        $self->{NORMAL_BUTTON} = 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, $self->{STANDARD_BUTTON_SIZE}, $self->{STANDARD_BUTTON_SIZE});
        $self->{LARGE_BUTTON} = 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, $self->{STANDARD_BUTTON_SIZE} << 1, $self->{STANDARD_BUTTON_SIZE} << 1);
    return $self;
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;

1;

