# Generated Code Do Not Modify

package org::allbinary::logic::string::StringMaker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{charArray} = undef;
    $self->{currentLength} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{charArray} = [("\0") x (20)];
    return $self;
}


sub append {
    my ($self, $string) = @_;
        my $stringLength = length($string);
        $self->ensureCapacity($self->{currentLength} + $stringLength);
        @{$self->{charArray}}[$self->{currentLength} .. $self->{currentLength} + ($stringLength) - (0) - 1] = split(//, substr($string, 0, ($stringLength) - (0)));
        $self->{currentLength} += $stringLength;
        return $self;
}


sub appendchar {
    my ($self, $c) = @_;
        $self->ensureCapacity($self->{currentLength} + 1);
        $self->{charArray}->[$self->{currentLength}++] = $c;
        return $self;
}


sub appendCharArray {
    my ($self, $charArray, $start, $end) = @_;
        $self->ensureCapacity($self->{currentLength} + ($end - $start));
        for (my $index = $start; $index < $end; $index++) {
            $self->{charArray}->[$self->{currentLength}++] = $charArray->[$index];
        }
        return $self;
}


sub appendbyte {
    my ($self, $b) = @_;
        $self->append(("" . ($b)));
        return $self;
}


sub appendshort {
    my ($self, $b) = @_;
        $self->append(("" . ($b)));
        return $self;
}


sub appendint {
    my ($self, $i) = @_;
        $self->append(("" . ($i)));
        return $self;
}


sub appendlong {
    my ($self, $l) = @_;
        $self->append(("" . ($l)));
        return $self;
}


sub appendfloat {
    my ($self, $f) = @_;
        $self->append(("" . ($f)));
        return $self;
}


sub appendboolean {
    my ($self, $bool) = @_;
        if ($bool) {
            $self->ensureCapacity($self->{currentLength} + 4);
            $self->{charArray}->[$self->{currentLength}++] = "t";
            $self->{charArray}->[$self->{currentLength}++] = "r";
            $self->{charArray}->[$self->{currentLength}++] = "u";
            $self->{charArray}->[$self->{currentLength}++] = "e";
        } else {
            $self->ensureCapacity($self->{currentLength} + 5);
            $self->{charArray}->[$self->{currentLength}++] = "f";
            $self->{charArray}->[$self->{currentLength}++] = "a";
            $self->{charArray}->[$self->{currentLength}++] = "l";
            $self->{charArray}->[$self->{currentLength}++] = "s";
            $self->{charArray}->[$self->{currentLength}++] = "e";
        }
        return $self;
}


sub ensureCapacity {
    my ($self, $minSize) = @_;
        my $oldCapacity = scalar(@{$self->{charArray}});
        if ($minSize > $oldCapacity) {
            my $newCapacity = $oldCapacity * 3;
            if ($newCapacity < $minSize) {
                $newCapacity = $minSize;
            }
            my $copy = [("\0") x ($newCapacity)];
            my $min = $self->min(scalar(@{$self->{charArray}}), $newCapacity);
            @{$copy}[0 .. 0 + $min - 1] = @{$self->{charArray}}[0 .. 0 + $min - 1];
            $self->{charArray} = $copy;
        }
}


sub min {
    my ($self, $value, $value2) = @_;
        return (($value <= $value2) ? $value : $value2);
}


sub delete {
    my ($self, $start, $end) = @_;
        $self->{currentLength} -= ($end - $start);
        return $self;
}


sub length {
    my ($self) = @_;
        return $self->{currentLength};
}


sub toString {
    my ($self) = @_;
        return join("", @{$self->{charArray}}[0 .. 0 + ($self->{currentLength}) - 1]);
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use java::lang::System;

1;

