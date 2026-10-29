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

package org::allbinary::game::score::ScoreComparator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::rms::RecordComparator';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{isHighestBest} = undef;
}


sub new {
    my ($class, $isHighestBest) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{isHighestBest} = $isHighestBest;
    return $self;
}


sub getBestScore {
    my ($self) = @_;
        return ($self->{isHighestBest} ? 9223372036854775807 : 0);
}


sub compare {
    my ($self, $recordOne, $recordTwo) = @_;
        my $byteArrayInputStreamOne = 'java::io::ByteArrayInputStream'->new($recordOne);
        my $inputStreamOne = 'java::io::DataInputStream'->new($byteArrayInputStreamOne);
        my $byteArrayInputStreamTwo = 'java::io::ByteArrayInputStream'->new($recordTwo);
        my $inputStreamTwo = 'java::io::DataInputStream'->new($byteArrayInputStreamTwo);
        my $scoreOne = 0;
        my $scoreTwo = 0;
        try {
            $inputStreamOne->readUTF();
            $inputStreamTwo->readUTF();
            $scoreOne = $inputStreamOne->readLong();
            $scoreTwo = $inputStreamTwo->readLong();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "compare", $e);
        }
        if ($self->{isHighestBest}) {
            return $self->getHighTooLow($scoreOne, $scoreTwo);
        } else {
            return $self->getLowTooHigh($scoreOne, $scoreTwo);
        }
}


sub getHighTooLow {
    my ($self, $scoreOne, $scoreTwo) = @_;
        if ($scoreOne > $scoreTwo) {
            return $javax::microedition::rms::RecordComparator::PRECEDES;
        } elsif ($scoreOne < $scoreTwo) {
            return $javax::microedition::rms::RecordComparator::FOLLOWS;
        } else {
            return $javax::microedition::rms::RecordComparator::EQUIVALENT;
        }
}


sub getLowTooHigh {
    my ($self, $scoreOne, $scoreTwo) = @_;
        if ($scoreOne < $scoreTwo) {
            return $javax::microedition::rms::RecordComparator::PRECEDES;
        } elsif ($scoreOne > $scoreTwo) {
            return $javax::microedition::rms::RecordComparator::FOLLOWS;
        } else {
            return $javax::microedition::rms::RecordComparator::EQUIVALENT;
        }
}

# use java::io::ByteArrayInputStream;
# use java::io::DataInputStream;
# use java::io::EOFException;
# use java::io::IOException;
# use javax::microedition::rms::RecordComparator;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

