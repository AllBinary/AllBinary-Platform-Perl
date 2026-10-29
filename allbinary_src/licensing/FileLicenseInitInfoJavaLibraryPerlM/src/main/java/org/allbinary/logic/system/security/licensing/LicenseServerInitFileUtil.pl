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

package org::allbinary::logic::system::security::licensing::LicenseServerInitFileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{NULL_OUTPUT_STREAM} = 'org::allbinary::logic::io::file::SimpleFileUtil'->nullOutputStream();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            my $filePath = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->{INITFILENAME};
            'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->setFilePath('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($filePath)) {
                $self->{logUtil}->putF("Using Existing License File", $self, $self->{commonStrings}->{INIT});
            } else {
                $self->write();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}


sub write {
    my ($self) = @_;
        my $fileOutputStream = $self->{NULL_OUTPUT_STREAM};
        try {
            my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
            my $filePath = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->{INITFILENAME};
            my $inputStream = $resourceUtil->getResourceAsStream($filePath);
            $self->{logUtil}->putF("Writing Default License File", $self, $self->{commonStrings}->{INIT});
            my $fileStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            $fileOutputStream = $fileStreamFactory->getFileOutputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $filePath);
            my $b = 0;
            my $index = 0;
            while (1) {
                $b = $inputStream->read();
                if ($b == -1) {
                    last;
                }
                $fileOutputStream->write($b);
                $index++;
            }
            $self->{logUtil}->putF("Wrote Bytes: " . $index, $self, $self->{commonStrings}->{INIT});
            $fileOutputStream->flush();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($fileOutputStream);
        }
}

# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::logic::io::file::SimpleFileUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

