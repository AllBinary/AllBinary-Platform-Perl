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

package org::allbinary::logic::io::LineReader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{fileName} = undef;
    $self->{string} = undef;
    $self->{index} = 0;
    $self->{idFile} = undef;
    $self->{idData} = undef;
}


sub new {
    my ($class, $fileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            my $bytes = [(0) x (100000)];
            $self->{fileName} = $fileName;
            $self->{idFile} = 'org::allbinary::logic::io::AbFileInputStream'->new($fileName);
            $self->{idFile}->read($bytes);
            $self->{string} = pack("C*", @{$bytes});
        } catch ($e) {
            $self->{logUtil}->put("File: " . $fileName, $self, "LineReader", $e);
            {
            }
        }
    return $self;
}


sub hasNext {
    my ($self) = @_;
        try {
            my $nextIndex = index($self->{string}, 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE}, $self->{index});
            if ($nextIndex == -1) {
                return 0;
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "hasNext", $e);
            {
            }
            return 0;
        }
}


# throws Exception
sub next {
    my ($self) = @_;
        try {
            my $nextIndex = index($self->{string}, 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE}, $self->{index});
            if ($nextIndex == -1) {
                die ("next() should have been called first");
            }
            my $temp = substr($self->{string}, $self->{index}, ($nextIndex) - ($self->{index}));
            $self->{index} = $nextIndex + 1;
            return $temp;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "next", $e);
            {
            }
            die $e;
        }
}

# use java::io::DataInputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::io::AbFileInputStream;

1;

