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

package org::allbinary::logic::io::AbFileOutputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::OutputStream';


sub _init_fields {
    my ($self) = @_;
    $self->{fileOutputStream} = undef;
}


# throws FileNotFoundException
sub createFromAbFile {
    my ($class, $file) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new('java::io::FileOutputStream'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file)));
}


# throws FileNotFoundException
sub createFromAbFileAppend {
    my ($class, $file, $append) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new('java::io::FileOutputStream'->new($file->getPath()));
}


# throws FileNotFoundException
sub createFromFilePath {
    my ($class, $name) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new('java::io::FileOutputStream'->new($name));
}


# throws FileNotFoundException
sub createFromFilePathAppend {
    my ($class, $name, $append) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new('java::io::FileOutputStream'->new($name));
}


sub new {
    my ($class, $fileOutputStream) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{fileOutputStream} = $fileOutputStream;
    return $self;
}


# throws IOException
sub close {
    my ($self) = @_;
        $self->{fileOutputStream}->close();
}


sub getChannel {
    my ($self) = @_;
        return $self->{fileOutputStream}->getChannel();
}


# throws IOException
sub write {
    my ($self, $buffer) = @_;
        $self->{fileOutputStream}->write($buffer);
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $buffer, $offset, $count) = @_;
        $self->{fileOutputStream}->write($buffer, $offset, $count);
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $b) = @_;
        $self->{fileOutputStream}->write($b);
}

# use java::io::FileNotFoundException;
# use java::io::FileOutputStream;
# use java::io::IOException;
# use java::io::OutputStream;
# use java::nio::channels::FileChannel;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;

1;

