# Generated Code Do Not Modify

package org::apache::commons::fileupload::FileItemUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::apache::commons::fileupload::FileItemUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{DEFAULT_CHARSET} = "ISO-8859-1";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::apache::commons::fileupload::FileItemUtil::instance;
}


# throws Exception
sub getString {
    my ($self, $byteArray) = @_;
        return pack("C*", @{$byteArray, $self->{DEFAULT_CHARSET}});
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getString {
    my ($self, $fileItem) = @_;
        return 'String'->new($self->getBytes($fileItem), $self->{DEFAULT_CHARSET});
}


# throws Exception
sub getBytes {
    my ($self, $fileItem) = @_;
        my $streamUtil = 'org::allbinary::logic::io::StreamUtil'->getInstance();
        my $inputStream = undef;
        my $outputStream = undef;
        try {
            $inputStream = $fileItem->openStream();
            $outputStream = 'java::io::ByteArrayOutputStream'->new();
            if ($fileItem->isFormField()) {
                $self->{logUtil}->putF("FileItemStream FieldName: " . $fileItem->getFieldName(), $self, "write()");
            } else {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Uploaded File FieldName: ");
                $stringBuffer->append($fileItem->getFieldName());
                $stringBuffer->append(" name = ");
                $stringBuffer->append($fileItem->getName());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "write()");
            }
            $outputStream = $streamUtil->get($inputStream, $outputStream, [(0) x (16384)]);
            return $outputStream->toByteArray();
        } catch ($exception) { die $exception; } finally {
            $streamUtil->close($outputStream);
            $streamUtil->close($inputStream);
        }
}


# throws Exception
sub write {
    my ($self, $fileItem, $file) = @_;
        $fileItem->write('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file));
}

# use java::io::ByteArrayOutputStream;
# use java::io::InputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;
use org::allbinary::logic::string::StringMaker;

1;

