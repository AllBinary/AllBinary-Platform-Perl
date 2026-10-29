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

package org::allbinary::input::motion::button::TouchButtonLocationHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use POSIX ();


sub _init_fields {
    my ($self) = @_;
    $self->{totalColumns} = undef;
    $self->{totalRows} = undef;
    $self->{columnsRemainder} = undef;
    $self->{rowsRemainder} = undef;
    $self->{columnsRemainderHalf} = undef;
    $self->{rowsRemainderHalf} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $buttonSize = 'org::allbinary::input::motion::button::CommonButtons'->getInstance()->{STANDARD_BUTTON_SIZE};
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{totalColumns} = POSIX::floor($displayInfo->getLastWidth() / $buttonSize + 0.5);
        $self->{totalRows} = POSIX::floor($displayInfo->getLastHeight() / $buttonSize + 0.5);
        $self->{columnsRemainder} = $displayInfo->getLastWidth() % $buttonSize;
        $self->{columnsRemainderHalf} = (POSIX::floor(($self->{columnsRemainder}) / (2 ** (1))));
        $self->{rowsRemainder} = $displayInfo->getLastHeight() % $buttonSize;
        $self->{rowsRemainderHalf} = (POSIX::floor(($self->{rowsRemainder}) / (2 ** (1))));
    return $self;
}


sub getTotalColumns {
    my ($self) = @_;
        return $self->{totalColumns};
}


sub getTotalRows {
    my ($self) = @_;
        return $self->{totalRows};
}


sub getColumnsRemainder {
    my ($self) = @_;
        return $self->{columnsRemainder};
}


sub getRowsRemainder {
    my ($self) = @_;
        return $self->{rowsRemainder};
}


sub getColumnsRemainderHalf {
    my ($self) = @_;
        return $self->{columnsRemainderHalf};
}


sub getRowsRemainderHalf {
    my ($self) = @_;
        return $self->{rowsRemainderHalf};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("totalColumns: ");
        $stringBuffer->appendint($self->{totalColumns});
        $stringBuffer->append(" totalRows: ");
        $stringBuffer->appendint($self->{totalRows});
        $stringBuffer->append(" columnsRemainder: ");
        $stringBuffer->appendint($self->{columnsRemainder});
        $stringBuffer->append(" rowsRemainder: ");
        $stringBuffer->appendint($self->{rowsRemainder});
        $stringBuffer->append(" columnsRemainderHalf: ");
        $stringBuffer->appendint($self->{columnsRemainderHalf});
        $stringBuffer->append(" rowsRemainderHalf: ");
        $stringBuffer->appendint($self->{rowsRemainderHalf});
        return $stringBuffer->toString();
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::input::motion::button::CommonButtons;

1;

