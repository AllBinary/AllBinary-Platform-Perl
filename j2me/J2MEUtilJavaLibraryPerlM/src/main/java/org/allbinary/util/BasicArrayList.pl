# Generated Code Do Not Modify

#This is a very fast and simple resizable list.
package org::allbinary::util::BasicArrayList;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $SIZE = ", Size: ";

sub _init_fields {
    my ($self) = @_;
    $self->{arrayUtil} = 'org::allbinary::util::ArrayUtil'->getInstance();
    $self->{objectArray} = undef;
    $self->{currentIndex} = 0;
}


sub new {
    my ($class, $objectArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{objectArray} = $objectArray;
    return $self;
}


sub addAt {
    my ($self, $index, $element) = @_;
        if ($index > $self->{currentIndex} || $index < 0) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL});
            $stringBuffer->appendint($index);
            $stringBuffer->append($org::allbinary::util::BasicArrayList::SIZE);
            $stringBuffer->appendint($self->{currentIndex});
            die ($stringBuffer->toString());
        }
        $self->ensureCapacity($self->{currentIndex} + 1);
        @{$self->{objectArray}}[$index + 1 .. $index + 1 + $self->{currentIndex} - $index - 1] = @{$self->{objectArray}}[$index .. $index + $self->{currentIndex} - $index - 1];
        $self->{objectArray}->[$index] = $element;
        $self->{currentIndex}++;
}


sub add {
    my ($self, $anyType) = @_;
        $self->ensureCapacity($self->{currentIndex} + 1);
        $self->{objectArray}->[$self->{currentIndex}++] = $anyType;
        return 1;
}


sub removeAt {
    my ($self, $index) = @_;
        if ($index >= $self->{currentIndex}) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL});
            $stringBuffer->appendint($index);
            $stringBuffer->append($org::allbinary::util::BasicArrayList::SIZE);
            $stringBuffer->appendint($self->{currentIndex});
            die ($stringBuffer->toString());
        }
        my $oldValue = $self->{objectArray}->[$index];
        my $numMoved = $self->{currentIndex} - $index - 1;
        if ($numMoved > 0) {
            @{$self->{objectArray}}[$index .. $index + $numMoved - 1] = @{$self->{objectArray}}[$index + 1 .. $index + 1 + $numMoved - 1];
        }
        $self->{objectArray}->[--$self->{currentIndex}] = undef;
        return $oldValue;
}


sub remove {
    my ($self, $anyType) = @_;
        if (!defined($anyType)) {
            for (my $index = 0; $index < $self->{currentIndex}; $index++) {
                if (!defined($self->{objectArray}->[$index])) {
                    my $numMoved = $self->{currentIndex} - $index - 1;
                    if ($numMoved > 0) {
                        @{$self->{objectArray}}[$index .. $index + $numMoved - 1] = @{$self->{objectArray}}[$index + 1 .. $index + 1 + $numMoved - 1];
                    }
                    $self->{objectArray}->[--$self->{currentIndex}] = undef;
                    return 1;
                }
            }
        } else {
            for (my $index = 0; $index < $self->{currentIndex}; $index++) {
                if ($anyType == $self->{objectArray}->[$index] || $anyType->equals($self->{objectArray}->[$index])) {
                    my $numMoved = $self->{currentIndex} - $index - 1;
                    if ($numMoved > 0) {
                        @{$self->{objectArray}}[$index .. $index + $numMoved - 1] = @{$self->{objectArray}}[$index + 1 .. $index + 1 + $numMoved - 1];
                    }
                    $self->{objectArray}->[--$self->{currentIndex}] = undef;
                    return 1;
                }
            }
        }
        return 0;
}


sub removeAll2 {
    my ($self, $list) = @_;
        my $result = 1;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            if ($self->remove($list->get($index))) {
            } else {
                $result = 0;
            }
        }
        return $result;
}


sub addAll2 {
    my ($self, $list) = @_;
        $self->ensureCapacity($self->{currentIndex} + $list->{currentIndex});
        my $listSize = $list->{currentIndex};
        for (my $index = 0; $index < $listSize; $index++) {
            $self->{objectArray}->[$self->{currentIndex}++] = $list->{objectArray}->[$index];
        }
        return 1;
}


sub addAllList {
    my ($self, $list) = @_;
        my $newObjectArray = $list->toArray();
        return $self->addAll($newObjectArray);
}


sub addAll {
    my ($self, $newObjectArray) = @_;
        my $numSize = scalar(@{$newObjectArray});
        $self->ensureCapacity($self->{currentIndex} + $numSize);
        @{$self->{objectArray}}[$self->{currentIndex} .. $self->{currentIndex} + $numSize - 1] = @{$newObjectArray}[0 .. 0 + $numSize - 1];
        $self->{currentIndex} += $numSize;
        return $numSize != 0;
}


sub ensureCapacity {
    my ($self, $minSize) = @_;
        my $oldCapacity = scalar(@{$self->{objectArray}});
        if ($minSize > $oldCapacity) {
            my $newCapacity = (POSIX::floor((($oldCapacity * 3)) / (2 ** (1)))) + 1;
            if ($newCapacity < $minSize) {
                $newCapacity = $minSize;
            }
            $self->{objectArray} = $self->{arrayUtil}->copyOf($self->{objectArray}, $newCapacity);
        }
}


sub trimToSize {
    my ($self) = @_;
        my $oldCapacity = scalar(@{$self->{objectArray}});
        if ($self->{currentIndex} < $oldCapacity) {
            $self->{objectArray} = $self->{arrayUtil}->copyOf($self->{objectArray}, $self->{currentIndex});
        }
}


sub indexOf {
    my ($self, $anyType) = @_;
        if (!defined($anyType)) {
            for (my $i = 0; $i < $self->{currentIndex}; $i++) {
                if (!defined($self->{objectArray}->[$i])) {
                    return $i;
                }
            }
        } else {
            for (my $i = 0; $i < $self->{currentIndex}; $i++) {
                if ($anyType->equals($self->{objectArray}->[$i])) {
                    return $i;
                }
            }
        }
        return -1;
}


sub lastIndexOf {
    my ($self, $anyType) = @_;
        if (!defined($anyType)) {
            for (my $i = $self->{currentIndex} - 1; $i >= 0; $i--) {
                if (!defined($self->{objectArray}->[$i])) {
                    return $i;
                }
            }
        } else {
            for (my $i = $self->{currentIndex} - 1; $i >= 0; $i--) {
                if ($anyType->equals($self->{objectArray}->[$i])) {
                    return $i;
                }
            }
        }
        return -1;
}


sub get {
    my ($self, $index) = @_;
        if ($index >= $self->{currentIndex}) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL});
            $stringBuffer->appendint($index);
            $stringBuffer->append($org::allbinary::util::BasicArrayList::SIZE);
            $stringBuffer->appendint($self->{currentIndex});
            die ($stringBuffer->toString());
        }
        return $self->{objectArray}->[$index];
}


sub set {
    my ($self, $index, $element) = @_;
        if ($index >= $self->{currentIndex}) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{INDEX_LABEL});
            $stringBuffer->appendint($index);
            $stringBuffer->append($org::allbinary::util::BasicArrayList::SIZE);
            $stringBuffer->appendint($self->{currentIndex});
            die ($stringBuffer->toString());
        }
        my $oldValue = $self->{objectArray}->[$index];
        $self->{objectArray}->[$index] = $element;
        return $oldValue;
}


sub clear {
    my ($self) = @_;
        for (my $i = 0; $i < $self->{currentIndex}; $i++) {
            $self->{objectArray}->[$i] = undef;
        }
        $self->{currentIndex} = 0;
}


sub size {
    my ($self) = @_;
        return $self->{currentIndex};
}


sub isEmpty {
    my ($self) = @_;
        return $self->{currentIndex} == 0;
}


sub contains {
    my ($self, $anyType) = @_;
        return $self->indexOf($anyType) >= 0;
}


sub toArray {
    my ($self) = @_;
        return $self->{arrayUtil}->copyOf($self->{objectArray}, $self->{currentIndex});
}


sub toArrayType {
    my ($self, $objectArray) = @_;
        if (scalar(@{$objectArray}) < $self->{currentIndex}) {
            return $self->{arrayUtil}->copyOfType($self->{objectArray}, $self->{currentIndex}, ref($objectArray));
        }
        @{$objectArray}[0 .. 0 + $self->{currentIndex} - 1] = @{$self->{objectArray}}[0 .. 0 + $self->{currentIndex} - 1];
        if (scalar(@{$objectArray}) > $self->{currentIndex}) {
            $objectArray->[$self->{currentIndex}] = undef;
        }
        return $objectArray;
}


sub clone {
    my ($self) = @_;
        my $size = $self->size();
        my $list = 'org::allbinary::util::BasicArrayListS'->new($size);
        my $anyType = undef;
        for (my $index = 0; $index < $size; $index++) {
            $anyType = $self->{objectArray}->[$index];
            $list->add($anyType);
        }
        return $list;
}


sub toString {
    my ($self) = @_;
        my $COMMA_SEP = 'org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP};
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < $self->{currentIndex}; $index++) {
            $stringBuffer->append($self->{objectArray}->[$index]->toString());
            $stringBuffer->append($COMMA_SEP);
        }
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::util::ArrayUtil;
use java::lang::System;
use org::allbinary::util::BasicArrayListS;

1;

