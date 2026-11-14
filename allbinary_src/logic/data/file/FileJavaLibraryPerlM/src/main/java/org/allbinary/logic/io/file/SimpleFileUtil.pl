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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::SimpleFileUtil'->new() };

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
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::SimpleFileUtil::instance;
}


sub nullOutputStream {
    my ($class) = @_;
        return $org::allbinary::logic::io::NullOutputStream::NULL_OUTPUT_STREAM;
}


sub nullWriter {
    my ($class) = @_;
        return $org::allbinary::logic::io::NullWriter::NULL_WRITER;
}


sub nullReader {
    my ($class) = @_;
        return $org::allbinary::logic::io::NullReader::NULL_READER;
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
            my $s = pack("C*", @{$byteArray}[$startIndex .. $startIndex + (($index + $includeReturnLine - $returnLine - $startIndex)) - 1]);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::ByteArrayOutputStream ();
# use java::io::InputStream ();
# use java::io::OutputStream ();
# use java::io::Reader ();
# use java::io::Writer ();
use org::allbinary::logic::NullUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::NullOutputStream ();
use org::allbinary::logic::io::NullReader ();
use org::allbinary::logic::io::NullWriter ();
use org::allbinary::logic::io::StreamUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();

1;

