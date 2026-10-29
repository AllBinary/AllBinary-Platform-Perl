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

package org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{paymentTypeVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


{ # Java static initializer
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::types::BasicPaymentTypeUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub add {
    my ($self, $paymentType) = @_;
        $self->{paymentTypeVector}->add($paymentType);
}


# throws Exception
sub get {
    my ($self, $paymentTypeString) = @_;
        my $size = $self->{paymentTypeVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $paymentType = $self->{paymentTypeVector}->get($i);
            if ($paymentType->getName()->compareTo($paymentTypeString) == 0) {
                return $paymentType;
            }
        }
        die ("Unknown PaymentType: " . $paymentTypeString);
}


sub isContain {
    my ($self, $paymentType) = @_;
        return $self->{paymentTypeVector}->contains($paymentType);
}


sub difference {
    my ($self, $a_PaymentTypeVector) = @_;
        my $diff = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $self->{paymentTypeVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $paymentType = $self->{paymentTypeVector}->get($i);
            if (!$a_PaymentTypeVector->contains($paymentType)) {
                $diff->add($paymentType);
            }
        }
        return $diff;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;

1;

