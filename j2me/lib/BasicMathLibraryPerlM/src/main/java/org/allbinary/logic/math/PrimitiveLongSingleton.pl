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

package org::allbinary::logic::math::PrimitiveLongSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::PrimitiveLongSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{UNK} = ["U", "n", "k"];
    $self->{NUMBER_ARRAY} = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    $self->{NUMBER_CHAR_ARRAY} = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    $self->{NUMBER_CHAR_ARRAYS} = [["0"], ["1"], ["2"], ["3"], ["4"], ["5"], ["6"], ["7"], ["8"], ["9"]];
    $self->{ZERO} = [$self->{NUMBER_CHAR_ARRAY}->[0]];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::PrimitiveLongSingleton::instance;
}


# throws Exception
sub getNumberFromChar {
    my ($self, $numberAsChar) = @_;
        my $size = scalar(@{$self->{NUMBER_CHAR_ARRAY}});
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{NUMBER_CHAR_ARRAY}->[$index] eq $numberAsChar) {
                return $self->{NUMBER_ARRAY}->[$index];
            }
        }
        die ('org::allbinary::logic::string::StringMaker'->new()->append("numberAsChar was not in array: ")->appendchar($numberAsChar)->toString());
}

use org::allbinary::logic::string::StringMaker;

1;

