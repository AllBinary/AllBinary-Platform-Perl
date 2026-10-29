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

package org::allbinary::logic::visual::transform::BasicTransformer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::AbTransformer';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{streamUtil} = 'org::allbinary::logic::io::StreamUtil'->getInstance();
    $self->{abeClientInformation} = undef;
}


sub new {
    my ($class, $abeClientInformation, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->setTemplateAsInputStream();
    return $self;
}


# throws Exception
sub setEncryptedTemplateFileAsInputStream {
    my ($self, $file) = @_;
        my $outputStream = undef;
        my $inputStream = undef;
        try {
            $outputStream = 'java::io::ByteArrayOutputStream'->new();
            $inputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
            $outputStream = $self->{streamUtil}->get($inputStream, $outputStream, [(0) x (16384)]);
            my $abCrypt = 'org::allbinary::logic::control::crypt::jcehelper::AbCrypt'->new($org::allbinary::logic::control::crypt::jcehelper::KeySpecFactory::DESEDE, 'org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($self->{abeClientInformation}, $file->getAbsolutePath()));
            my $decrypted = $abCrypt->decrypt($outputStream->toByteArray());
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Decrypted Template: \n" . pack("C*", @{$decrypted}), $self, "setEncryptedTemplateFileAsInputStream(file)");
            }
            $self->setInputStream('java::io::ByteArrayInputStream'->new($decrypted));
            $self->setURIResolver('org::allbinary::data::tree::dom::BasicUriResolver'->new('org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{ENCRYPTED_EXTENSION}));
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Failed to get Encrypted File: ");
                $stringBuffer->append($file->getPath());
                $stringBuffer->append(" \nName:");
                $stringBuffer->append($file->getName());
                $self->{logUtil}->put($stringBuffer->toString(), $self, "setEncryptedTemplateFileAsInputStream()", $e);
            }
            die $e;
        } finally {
            $self->{streamUtil}->close($outputStream);
            $self->{streamUtil}->close($inputStream);
        }
}


# throws Exception
sub setEncryptedTemplateAsInputStream {
    my ($self) = @_;
        my $outputStream = undef;
        my $inputStream = undef;
        try {
            $outputStream = 'java::io::ByteArrayOutputStream'->new();
            $inputStream = 'java::io::ByteArrayInputStream'->new($self->getTransformInfoInterface()->getTemplate()->getBytes());
            $outputStream = $self->{streamUtil}->get($inputStream, $outputStream, [(0) x (16384)]);
            my $abCrypt = 'org::allbinary::logic::control::crypt::jcehelper::AbCrypt'->new($org::allbinary::logic::control::crypt::jcehelper::KeySpecFactory::DESEDE, 'org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($self->{abeClientInformation}, $self->getTransformInfoInterface()->getName()));
            my $decrypted = $abCrypt->decrypt($outputStream->toByteArray());
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Decrypted Template: \n" . $decrypted->toString(), $self, "setEncryptedTemplateAsInputStream()");
            }
            $self->setInputStream('java::io::ByteArrayInputStream'->new($decrypted));
            $self->setURIResolver('org::allbinary::data::tree::dom::BasicUriResolver'->new('org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{ENCRYPTED_EXTENSION}));
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put("Failed to set with template: " . $self->getTransformInfoInterface()->getTemplateFilePath(), $self, "setEncryptedTemplateFileAsInputStream()", $e);
            }
            die $e;
        } finally {
            $self->{streamUtil}->close($outputStream);
            $self->{streamUtil}->close($inputStream);
        }
}


# throws Exception
sub setTemplateAsInputStream {
    my ($self) = @_;
        my $inputStream = undef;
        my $outputStream = undef;
        try {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF($self->getTransformInfoInterface()->log(), $self, "setTemplateAsInputStream()");
            }
            my $transformInfoTemplateData = 'org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance();
            my $pathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
            if (defined($self->getTransformInfoInterface()->getTemplateFilePath())) {
                my $extension = $pathUtil->getExtensionWithAbPath($self->getTransformInfoInterface()->getTemplateFilePath());
                my $filePath = $pathUtil->getWithoutExtensionWithAbPath($self->getTransformInfoInterface()->getTemplateFilePath());
                if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                    $self->{logUtil}->putF($self->getTransformInfoInterface()->log(), $self, "setTemplateAsInputStream()");
                }
                if (($extension cmp $transformInfoTemplateData->{UNCRYPTED_EXTENSION}) == 0) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($filePath);
                    $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
                    $stringBuffer->append($transformInfoTemplateData->{ENCRYPTED_EXTENSION});
                    my $encFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
                    if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                        $self->{logUtil}->putF($self->getTransformInfoInterface()->log(), $self, "setTemplateAsInputStream()");
                    }
                    if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                        $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Encrypted Template File isFile=");
                        $stringBuffer->appendboolean($encFile->isFile());
                        $stringBuffer->append("\nEncTemplateFilePath: ");
                        $stringBuffer->append($encFile->getPath());
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, "setTemplateAsInputStream()");
                    }
                    if ($encFile->isFile()) {
                        $self->setEncryptedTemplateFileAsInputStream($encFile);
                        return;
                    } else {
                        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($self->getTransformInfoInterface()->getTemplateFilePath());
                        if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                            $self->{logUtil}->putF($self->getTransformInfoInterface()->log(), $self, "setTemplateAsInputStream()");
                        }
                        if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                            $self->{logUtil}->putF("Template File isFile=" . $file->isFile(), $self, "setTemplateAsInputStream()");
                        }
                        if ($file->isFile()) {
                            $inputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
                            $outputStream = 'java::io::ByteArrayOutputStream'->new();
                            $outputStream = $self->{streamUtil}->get($inputStream, $outputStream, [(0) x (16384)]);
                            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                                $self->{logUtil}->putF("Template: " . $outputStream->toString(), $self, "getTemplateAsInputStream()");
                            }
                            $self->setInputStream('java::io::ByteArrayInputStream'->new($outputStream->toByteArray()));
                            $self->setURIResolver('org::allbinary::data::tree::dom::BasicUriResolver'->new($transformInfoTemplateData->{UNCRYPTED_EXTENSION}));
                            return;
                        }
                    }
                } elsif (($extension cmp $transformInfoTemplateData->{ENCRYPTED_EXTENSION}) == 0) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($filePath);
                    $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
                    $stringBuffer->append($transformInfoTemplateData->{ENCRYPTED_EXTENSION});
                    my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
                    if ($file->isFile()) {
                        $self->setEncryptedTemplateFileAsInputStream($file);
                    }
                } else {
                    die ("View Template File Type Is Not Recognized: " . $self->getTransformInfoInterface()->getTemplateFilePath());
                }
            } else {
                $self->setEncryptedTemplateAsInputStream();
            }
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put("Failed to get Template Data", $self, "setTemplateAsInputStream()", $e);
            }
            die $e;
        } finally {
            $self->{streamUtil}->close($outputStream);
            $self->{streamUtil}->close($inputStream);
        }
        die ("Error setTemplateAsInputStream()");
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::InputStream;
# use javax::xml::transform::URIResolver;
use org::allbinary::data::tree::dom::BasicUriResolver;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::jcehelper::AbCrypt;
use org::allbinary::logic::control::crypt::jcehelper::KeySpecFactory;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::AbKeys;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData;
use org::allbinary::logic::visual::transform::AbTransformer;

1;

