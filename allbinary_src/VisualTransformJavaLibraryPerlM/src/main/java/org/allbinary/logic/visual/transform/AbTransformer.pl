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

package org::allbinary::logic::visual::transform::AbTransformer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::BasicTransformerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{transformInfoInterface} = undef;
    $self->{inputStream} = undef;
    $self->{uriResolver} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
    return $self;
}


sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


sub setInputStream {
    my ($self, $inputStream) = @_;
        $self->{inputStream} = $inputStream;
}


sub setURIResolver {
    my ($self, $uriResolver) = @_;
        $self->{uriResolver} = $uriResolver;
}


sub getInputStream {
    my ($self) = @_;
        return $self->{inputStream};
}


sub getURIResolver {
    my ($self) = @_;
        return $self->{uriResolver};
}


sub getStreamSource {
    my ($self) = @_;
        return 'javax::xml::transform::stream::StreamSource'->new($self->getInputStream());
}


# throws Exception
sub translate {
    my ($self, $xmlDocumentStr) = @_;
        try {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XMLLOGGING})) {
                $self->{logUtil}->putF("xml: \n" . $xmlDocumentStr, $self, "translate(String xmlDocumentStr)");
            }
            if (!defined($self->getURIResolver())) {
                die ("No URIResolver");
            }
            my $result = 'org::allbinary::data::tree::dom::XslHelper'->getInstance()->translate($self->getURIResolver(), 'javax::xml::transform::stream::StreamSource'->new($self->getInputStream()), 'javax::xml::transform::stream::StreamSource'->new('java::io::StringBufferInputStream'->new($xmlDocumentStr)));
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGING})) {
                $self->{logUtil}->putF("translated xml: " . $result, $self, "translate(String xmlDocumentStr)");
            }
            my $transformInfoObjectConfigGeneratorInterface = 'org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory'->getInstance()->getInstance($self->getTransformInfoInterface());
            return $transformInfoObjectConfigGeneratorInterface->process($result);
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{transformInfoInterface}->log(), $self, "translate(document)", $e);
            }
            die $e;
        }
}

# use java::io::InputStream;
# use java::io::StringBufferInputStream;
# use javax::xml::transform::URIResolver;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::data::tree::dom::XslHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGenerator;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::visual::transform::BasicTransformerInterface;

1;

