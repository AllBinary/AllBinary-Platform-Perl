# Generated Code Do Not Modify

package org::allbinary::util::ArrayUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::util::ArrayUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::util::ArrayUtil::instance;
}


sub copyOf {
    my ($self, $original, $newLength) = @_;
        return $self->copyOfType($original, $newLength, ref($original));
}


sub copyOfType {
    my ($self, $original, $newLength, $newType) = @_;
        my $copy = [(undef) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfbyte {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfshort {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfint {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOflong {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfchar {
    my ($self, $original, $newLength) = @_;
        my $copy = [("\0") x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOffloat {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0.0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfdouble {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0.0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub copyOfboolean {
    my ($self, $original, $newLength) = @_;
        my $copy = [(0) x ($newLength)];
        @{$copy}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1] = @{$original}[0 .. 0 + $self->{mathUtil}->min(scalar(@{$original}), $newLength) - 1];
        return $copy;
}


sub reverse {
    my ($self, $intArray) = @_;
        my $length = scalar(@{$intArray}) - 1;
        my $temp = 0;
        my $size = int($length / 2);
        for (my $index = 0; $index <= $size; $index++) {
            $temp = $intArray->[$index];
            $intArray->[$index] = $intArray->[$length - $index];
            $intArray->[$length - $index] = $temp;
        }
}


sub flip {
    my ($self, $intArray, $width, $height) = @_;
        my $length = $height - 1;
        my $temp = 0;
        my $index = 0;
        my $rowIndex = 0;
        for (my $y = 0; $y <= int($length / 2); $y++) {
            for (my $x = 0; $x < $width; $x++) {
                $rowIndex = (($length - $y) * $width);
                $index = $x + ($y * $width);
                $temp = $intArray->[$index];
                $intArray->[$index] = $intArray->[$rowIndex + $x];
                $intArray->[$rowIndex + $x] = $temp;
            }
        }
}


sub toStringFromTwoDimensionaArray {
    my ($self, $twoDimensionalIntArray) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $endIndex = scalar(@{$twoDimensionalIntArray});
        my $endIndex2 = scalar(@{$twoDimensionalIntArray->[0]});
        for (my $index = 0; $index < $endIndex; $index++) {
            $stringBuffer->append($commonSeps->{BRACE_OPEN});
            for (my $index2 = 0; $index2 < $endIndex2; $index2++) {
                $stringBuffer->appendint(int($twoDimensionalIntArray->[$index]->[$index2]));
                $stringBuffer->append($commonSeps->{COMMA_SEP});
            }
            $stringBuffer->append($commonSeps->{BRACE_CLOSE});
            $stringBuffer->append($commonSeps->{NEW_LINE});
        }
        return $stringBuffer->toString();
}


sub toStringFromObjectArray {
    my ($self, $objectArray) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        for (my $index = 0; $index < scalar(@{$objectArray}); $index++) {
            $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($objectArray->[$index]));
            $stringBuffer->append($commonSeps->{COMMA_SEP});
        }
        return $stringBuffer->toString();
}


sub toStringFromByteArray {
    my ($self, $byteArray) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        for (my $index = 0; $index < scalar(@{$byteArray}); $index++) {
            $stringBuffer->appendbyte($byteArray->[$index]);
            $stringBuffer->append($commonSeps->{COMMA_SEP});
        }
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
# use jsinterop::annotations::JsMethod;
use java::lang::System;

1;

