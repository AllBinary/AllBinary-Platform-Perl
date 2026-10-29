# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

#J2SE
package org::allbinary::TsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'org::allbinary::TsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::TsUtil::instance;
}


sub hashCode {
    my ($self, $anyType) = @_;
        return $anyType->hashCode();
}


# throws InterruptedException
sub waitFor {
    my ($self, $any, $timeoutMillis) = @_;
        my $anyType = $any;
        $anyType->wait($timeoutMillis);
}


# throws RecordStoreNotOpenException, InvalidRecordIDException, RecordStoreException
sub getRecord {
    my ($self, $anyType, $recordId) = @_;
        my $recordStore = $anyType;
        my $data = undef;
        { # synchronized ($self)
            $data = [(0) x ($recordStore->getRecordSize($recordId))];
            $recordStore->getRecord($recordId, $data, 0);
        }
        return (scalar(@{$data}) < 1 ? 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY} : $data);
}


sub compareTo {
    my ($self, $a, $b) = @_;
        return ($a cmp $b);
}


sub equalIgnoreCase {
    my ($self, $a, $b) = @_;
        return (lc($a) eq lc($b));
}


sub equalsNotstring {
    my ($self, $anyType, $object2) = @_;
        return $anyType->equals($object2);
}


sub getClassClassLoader {
    my ($self, $anyType) = @_;
        return ref($anyType)->getClassLoader();
}


sub toNumberFromChar {
    my ($self, $value) = @_;
        return ord($value);
}


sub toNumber {
    my ($self, $value) = @_;
        return $value;
}


sub getByteArray {
    my ($self, $string) = @_;
        return [unpack("C*", $string)];
}


sub isItemListener {
    my ($self, $owner) = @_;
        if ((Scalar::Util::blessed($owner) && $owner->isa('javax::microedition::lcdui::Form'))) {
            return 1;
        } else {
            return 0;
        }
}


sub gc {
    my ($self) = @_;
        1;
}

# use javax::microedition::lcdui::Displayable;
# use javax::microedition::lcdui::Form;
# use javax::microedition::rms::InvalidRecordIDException;
# use javax::microedition::rms::RecordStore;
# use javax::microedition::rms::RecordStoreException;
# use javax::microedition::rms::RecordStoreNotOpenException;
use org::allbinary::logic::NullUtil;
use java::lang::System;

1;

