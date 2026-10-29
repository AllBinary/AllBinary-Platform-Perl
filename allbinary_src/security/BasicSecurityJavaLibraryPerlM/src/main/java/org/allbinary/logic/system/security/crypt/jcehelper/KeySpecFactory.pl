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

package org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DES} = "DES";
    $self->{DESEDE} = "DESede";
    $self->{BLOWFISH} = "Blowfish";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $algorithm, $keyData) = @_;
        try {
            my $tsUtil = 'org::allbinary::TsUtil'->getInstance();
            if ($tsUtil->compareTo($algorithm, $self->{DES}) == 0) {
                return 'javax::crypto::spec::DESKeySpec'->new($keyData);
            } elsif ($tsUtil->compareTo($algorithm, $self->{DESEDE}) == 0) {
                return 'javax::crypto::spec::DESedeKeySpec'->new($keyData);
            } else {
                die ("RuntimeException");
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            die ("RuntimeException");
        }
}

# use java::security::spec::KeySpec;
# use javax::crypto::spec::DESKeySpec;
# use javax::crypto::spec::DESedeKeySpec;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;

1;

