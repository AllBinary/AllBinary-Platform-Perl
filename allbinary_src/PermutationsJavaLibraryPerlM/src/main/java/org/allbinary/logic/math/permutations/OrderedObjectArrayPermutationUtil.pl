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

package org::allbinary::logic::math::permutations::OrderedObjectArrayPermutationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::permutations::OrderedObjectArrayPermutationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TOTAL_ITERATIONS_TABLE} = "Total Iterations: ";
    $self->{FINISHED} = "\nFINISHED";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::permutations::OrderedObjectArrayPermutationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getNext {
    my ($self, $data) = @_;
        my $length = scalar(@{$data});
        my $i = $length - 1;
        my $tsUtil = 'org::allbinary::TsUtil'->getInstance();
        while ($tsUtil->hashCode($data->[$i - 1]) >= $tsUtil->hashCode($data->[$i])) {
            $i = $i - 1;
        }
        my $j = $length;
        while ($tsUtil->hashCode($data->[$j - 1]) <= $tsUtil->hashCode($data->[$i - 1])) {
            $j = $j - 1;
        }
        $self->swap($data, $i - 1, $j - 1);
        $i++;
        $j = $length;
        while ($i < $j) {
            $self->swap($data, $i - 1, $j - 1);
            $i++;
            $j--;
        }
}


sub swap {
    my ($self, $data, $a, $b) = @_;
        my $temp = $data->[$a];
        $data->[$a] = $data->[$b];
        $data->[$b] = $temp;
}


sub factorial {
    my ($self, $dataLength) = @_;
        my $temp = 1;
        if ($dataLength > 1) {
            for (my $i = 1; $i <= $dataLength; $i++) {
                $temp *= $i;
            }
        }
        return $temp;
}


sub generate {
    my ($self, $data, $visitor) = @_;
        my $iterations = $self->factorial(scalar(@{$data}));
        print($self->{TOTAL_ITERATIONS_TABLE});
        print($iterations, "\n");
        for (my $count = 0; $count < $iterations - 1; $count++) {
            $self->getNext($data);
            $visitor->visit($self);
        }
        print($self->{FINISHED}, "\n");
}


sub main {
    my ($class, $args) = @_;
        my $TOTAL = 7;
        my $data = [(undef) x ($TOTAL)];
        for (my $i = 0; $i < $TOTAL; $i++) {
            $data->[$i] = 'org::allbinary::logic::math::permutations::ComparableObject'->new();
        }
        'java::util::Arrays'->sort($data);
        my $permutationVisitor = 'org::allbinary::logic::math::permutations::ObjectPermutationVisitor'->new($data);
        my $ORIGINAL_DATA_LABEL = "Original Data: ";
        print($ORIGINAL_DATA_LABEL);
        $permutationVisitor->visit($data);
        'org::allbinary::logic::math::permutations::OrderedObjectArrayPermutationUtil'->getInstance()->generate($data, $permutationVisitor);
}

# use java::util::Arrays;
use org::allbinary::TsUtil;
use org::allbinary::logic::util::visitor::Visitor;
use java::lang::System;
use org::allbinary::logic::math::permutations::ComparableObject;
use org::allbinary::logic::math::permutations::ObjectPermutationVisitor;

1;

