# Generated Code Do Not Modify

package org::allbinary::logic::math::permutations::IntPermutationVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::Visitor';


sub _init_fields {
    my ($self) = @_;
    $self->{data} = undef;
    $self->{stringBuilder} = 'org::allbinary::logic::string::StringMaker'->new();
}


sub new {
    my ($class, $data) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{data} = $data;
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
        $self->print($self->{data}, $self->{stringBuilder});
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


sub print {
    my ($self, $data) = @_;
        my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
        $self->print($data, $stringBuilder);
}


# Java overloaded method: Perl keeps the last definition
sub print {
    my ($self, $data, $stringBuilder) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $size = scalar(@{$data});
        for (my $i = 0; $i < $size; $i++) {
            $stringBuilder->appendint($data->[$i]);
            $stringBuilder->append($commonSeps->{SPACE});
        }
        print($stringBuilder->toString(), "\n");
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::string::CommonSeps;
use java::lang::System;

1;

