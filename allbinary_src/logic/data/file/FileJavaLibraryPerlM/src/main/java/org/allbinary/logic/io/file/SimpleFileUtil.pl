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

package org::allbinary::logic::io::file::SimpleFileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::SimpleFileUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NULL_WRITER} = 'org::allbinary::logic::io::file::SimpleFileUtil'->nullWriter();
    $self->{NULL_READER} = 'org::allbinary::logic::io::file::SimpleFileUtil'->nullReader();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{nullUtil} = 'org::allbinary::logic::NullUtil'->getInstance();
    $self->{streamUtil} = 'org::allbinary::logic::io::StreamUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::SimpleFileUtil::instance;
}


sub nullOutputStream {
    my ($class) = @_;
        return do {
            package java::io::OutputStream::AnonymousN66096 { our @ISA = ('java::io::OutputStream');
            

            # throws IOException
            sub write {
                my ($self, $b) = @_;
            }
            

            # throws IOException
            sub write {
                my ($self, $b, $off, $len) = @_;
            }
            

            sub close {
                my ($self) = @_;
            }
            }
            'java::io::OutputStream::AnonymousN66096'->can('new') ? 'java::io::OutputStream::AnonymousN66096'->new() : bless({}, 'java::io::OutputStream::AnonymousN66096')
        };
}


sub nullWriter {
    my ($class) = @_;
        return do {
            package java::io::Writer::AnonymousN66330 { our @ISA = ('java::io::Writer');
            $self->{closed} = 0;
            

            # throws IOException
            sub append {
                my ($self, $c) = @_;
                return $self;
            }
            

            # throws IOException
            sub append {
                my ($self, $csq) = @_;
                return $self;
            }
            

            # throws IOException
            sub append {
                my ($self, $csq, $start, $end) = @_;
                return $self;
            }
            

            # throws IOException
            sub write {
                my ($self, $c) = @_;
            }
            

            # throws IOException
            sub write {
                my ($self, $cbuf, $off, $len) = @_;
            }
            

            # throws IOException
            sub write {
                my ($self, $str) = @_;
            }
            

            # throws IOException
            sub write {
                my ($self, $str, $off, $len) = @_;
            }
            

            # throws IOException
            sub flush {
                my ($self) = @_;
            }
            

            # throws IOException
            sub close {
                my ($self) = @_;
            }
            }
            'java::io::Writer::AnonymousN66330'->can('new') ? 'java::io::Writer::AnonymousN66330'->new() : bless({}, 'java::io::Writer::AnonymousN66330')
        };
}


sub nullReader {
    my ($class) = @_;
        return do {
            package java::io::Reader::AnonymousN67059 { our @ISA = ('java::io::Reader');
            

            # throws IOException
            sub read {
                my ($self) = @_;
                return -1;
            }
            

            # throws IOException
            sub read {
                my ($self, $cbuf, $off, $len) = @_;
                return -1;
            }
            

            # throws IOException
            sub read {
                my ($self, $target) = @_;
                return -1;
            }
            

            # throws IOException
            sub ready {
                my ($self) = @_;
                return 0;
            }
            

            # throws IOException
            sub skip {
                my ($self, $n) = @_;
                return 0;
            }
            

            sub close {
                my ($self) = @_;
            }
            }
            'java::io::Reader::AnonymousN67059'->can('new') ? 'java::io::Reader::AnonymousN67059'->new() : bless({}, 'java::io::Reader::AnonymousN67059')
        };
}


sub loadFileAsList {
    my ($self, $inputStream, $max, $byteArray1) = @_;
        return $self->loadFileAsListReturnLine($inputStream, $max, $byteArray1, 0);
}


sub loadFileAsListReturnLine {
    my ($self, $inputStream, $max, $byteArray1, $includeReturnLine) = @_;
        my $stringList = 'org::allbinary::util::BasicArrayListD'->new();
        if (!defined($inputStream)) {
            return $stringList;
        }
        my $byteArray = $self->{nullUtil}->{NULL_BYTE_ARRAY};
        try {
            my $outputStream2 = 'java::io::ByteArrayOutputStream'->new($max);
            $byteArray = $self->{streamUtil}->getByteArray($inputStream, $outputStream2, $byteArray1);
            $self->{streamUtil}->close($inputStream);
        } catch ($e) {
            $self->{streamUtil}->close($inputStream);
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD}, $e);
        }
        if (!defined($byteArray)) {
            return $stringList;
        }
        my $size = scalar(@{$byteArray});
        my $index = 0;
        my $startIndex = 0;
        my $returnLine = 0;
        while ($index < $size) {
            $startIndex = $index;
            while ($index < $size - 1 && $byteArray->[$index] != ord("\n")) {
                $index++;
            }
            if ($includeReturnLine == 0) {
                if ($index > 0 && $byteArray->[$index - 1] == ord("\r")) {
                    $returnLine = 1;
                } else {
                    $returnLine = 0;
                }
            }
            my $s = pack("C*", @{$byteArray, $startIndex, ($index + $includeReturnLine - $returnLine - $startIndex)});
            $stringList->add($s);
            $index++;
        }
        return $stringList;
}


sub createStringFromArrayOfStrings {
    my ($self, $stringArray) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = scalar(@{$stringArray});
        for (my $index = 0; $index < $size; $index++) {
            $stringMaker->append($stringArray->[$index]);
        }
        return $stringMaker->toString();
}

# use java::io::ByteArrayOutputStream;
# use java::io::IOException;
# use java::io::InputStream;
# use java::io::OutputStream;
# use java::io::Reader;
# use java::io::Writer;
# use java::nio::CharBuffer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

