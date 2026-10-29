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

package org::allbinary::logic::java::byteutil::ByteUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::java::byteutil::ByteUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::byteutil::ByteUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub xor {
    my ($self, $array, $mask) = @_;
        my $bytes = [(0) x (scalar(@{$array}))];
        my $size = scalar(@{$array});
        my $index = 0;
        my $currentByte = 0;
        while ($index < $size) {
            $currentByte = $array->[$index];
            $bytes->[$index] = ((int(($currentByte ^ $mask)) + 128) % 256 - 128);
            $index++;
        }
        return $bytes;
}


sub not {
    my ($self, $array) = @_;
        my $bytes = [(0) x (scalar(@{$array}))];
        my $size = scalar(@{$array});
        my $index = 0;
        while ($index < $size) {
            $bytes->[$index] = ((int(~$array->[$index]) + 128) % 256 - 128);
            $index++;
        }
        return $bytes;
}


sub xorByte {
    my ($self, $array, $index) = @_;
        my $mask = 0;
        if ($index == 0) {
            $mask = 1;
        }
        if ($index == 1) {
            $mask = 2;
        }
        if ($index == 2) {
            $mask = 4;
        }
        if ($index == 3) {
            $mask = 8;
        }
        if ($index == 4) {
            $mask = 16;
        }
        if ($index == 5) {
            $mask = 32;
        }
        if ($index == 6) {
            $mask = 64;
        }
        if ($index == 7) {
            $mask = ((int(-127) + 128) % 256 - 128);
        }
        return $self->xor($array, $mask);
}


sub compare {
    my ($self, $newByteArray, $oldByteArray) = @_;
        if (scalar(@{$newByteArray}) != scalar(@{$oldByteArray})) {
            return 0;
        } else {
        }
        my $size = scalar(@{$newByteArray});
        for (my $index = 0; $index < $size; $index++) {
            if ($newByteArray->[$index] != $oldByteArray->[$index]) {
                return 0;
            }
        }
        return 1;
}


sub compareWithStats {
    my ($self, $newByteArray, $newSize, $oldByteArray, $stats) = @_;
        if ($newSize != scalar(@{$oldByteArray})) {
            $stats->[0] = -1;
            $stats->[2] = $newSize;
            $stats->[3] = scalar(@{$oldByteArray});
            return 0;
        } else {
            $stats->[0] = $newSize;
        }
        $stats->[1] = 0;
        my $size = $newSize;
        for (my $index = 0; $index < $size; $index++) {
            if ($newByteArray->[$index] != $oldByteArray->[$index]) {
                return 0;
            }
            $stats->[1]++;
        }
        return 1;
}


1;

