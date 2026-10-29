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

package org::allbinary::logic::visual::transform::data::TransformDocument;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::data::TransformDocumentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{baseNode} = undef;
    $self->{document} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
            my $allbinaryNode = $self->{document}->createElement("allbinary");
            $self->{baseNode} = $allbinaryNode;
            $self->{document}->appendChild($self->{baseNode});
            if ($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->putF($self->log(), $self, $self->{commonStrings}->{CONSTRUCTOR});
            }
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die $e;
        }
    return $self;
}


sub getBaseNode {
    my ($self) = @_;
        return $self->{baseNode};
}


sub getDoc {
    my ($self) = @_;
        return $self->{document};
}


# throws Exception
sub log {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if (defined($self->{baseNode})) {
            $stringBuffer->append("BaseNode: ");
            $stringBuffer->append($self->{baseNode}->getNodeName());
        } else {
            $stringBuffer->append("Log-Error: BaseNode is Null");
        }
        $stringBuffer->append("\nDocument: ");
        $stringBuffer->append('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{document}));
        return $stringBuffer->toString();
}

use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;

1;

