# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

package org::allbinary::media::image::ImagePersistanceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImagePersistanceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImagePersistanceUtil::instance;
}


# throws Exception
sub saveWithBatik {
    my ($self, $file, $bufferedImage) = @_;
        my $batikPNGImageWriter = 'org::apache::batik::ext::awt::image::codec::png::PNGImageWriter'->new();
        my $fileOutputStream = 'org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($file);
        try {
            $batikPNGImageWriter->writeImage($bufferedImage, $fileOutputStream);
        } catch ($exception) { die $exception; } finally {
            $fileOutputStream->flush();
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($fileOutputStream);
        }
        $self->{logUtil}->putF("Wrote Image: " . $file->getAbsolutePath(), $self, $self->{commonStrings}->{SAVE});
}


sub saveWithImageIO {
    my ($self, $filePath, $bufferedImage) = @_;
        $self->saveWithImageIO('java::io::File'->new($filePath), $bufferedImage);
}


# Java overloaded method: Perl keeps the last definition
sub saveWithImageIO {
    my ($self, $file, $bufferedImage) = @_;
        my $writer = undef;
        my $ios = undef;
        try {
            my $iter = 'javax::imageio::ImageIO'->getImageWritersByFormatName("jpeg");
            if (!$iter->hasNext()) {
                $self->{logUtil}->putF("Unable to save image to jpeg file type.", $self, $self->{commonStrings}->{SAVE});
                return;
            }
            $writer = $iter->next();
            $ios = 'javax::imageio::ImageIO'->createImageOutputStream($file);
            $writer->setOutput($ios);
            my $iwp = $writer->getDefaultWriteParam();
            $iwp->setCompressionMode($javax::imageio::ImageWriteParam::MODE_EXPLICIT);
            $iwp->setCompressionQuality(0.95);
            $writer->write(undef, 'javax::imageio::IIOImage'->new($bufferedImage, undef, undef), $iwp);
            $self->{logUtil}->putF("Wrote Image: " . $file->getAbsolutePath(), $self, $self->{commonStrings}->{SAVE});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{SAVE}, $e);
        } finally {
            try {
                if (defined($ios)) {
                    $ios->flush();
                    try {
                        if (defined($ios)) {
                            $self->{logUtil}->putF($ios->toString(), $ios, $self->{commonStrings}->{CLOSE});
                            $ios->close();
                        }
                    } catch ($e) {
                        $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $ios, $self->{commonStrings}->{CLOSE}, $e);
                    }
                }
                if (defined($writer)) {
                    $writer->dispose();
                }
            } catch ($e2) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{SAVE}, $e2);
            }
        }
}

# use java::awt::image::BufferedImage;
use java::io::File;
# use java::io::IOException;
use java::util::Iterator;
# use javax::imageio::IIOImage;
# use javax::imageio::ImageIO;
# use javax::imageio::ImageWriteParam;
# use javax::imageio::ImageWriter;
# use javax::imageio::stream::ImageOutputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::string::CommonStrings;
use org::apache::batik::ext::awt::image::codec::png::PNGImageWriter;

1;

