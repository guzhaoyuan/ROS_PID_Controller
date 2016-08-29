; Auto-generated. Do not edit!


(cl:in-package imu_node-msg)


;//! \htmlinclude real_pose.msg.html

(cl:defclass <real_pose> (roslisp-msg-protocol:ros-message)
  ((real_pose
    :reader real_pose
    :initarg :real_pose
    :type cl:float
    :initform 0.0))
)

(cl:defclass real_pose (<real_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <real_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'real_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_node-msg:<real_pose> is deprecated: use imu_node-msg:real_pose instead.")))

(cl:ensure-generic-function 'real_pose-val :lambda-list '(m))
(cl:defmethod real_pose-val ((m <real_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_node-msg:real_pose-val is deprecated.  Use imu_node-msg:real_pose instead.")
  (real_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <real_pose>) ostream)
  "Serializes a message object of type '<real_pose>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'real_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <real_pose>) istream)
  "Deserializes a message object of type '<real_pose>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'real_pose) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<real_pose>)))
  "Returns string type for a message object of type '<real_pose>"
  "imu_node/real_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'real_pose)))
  "Returns string type for a message object of type 'real_pose"
  "imu_node/real_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<real_pose>)))
  "Returns md5sum for a message object of type '<real_pose>"
  "ae54faab9f6dc4fad859f28574716431")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'real_pose)))
  "Returns md5sum for a message object of type 'real_pose"
  "ae54faab9f6dc4fad859f28574716431")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<real_pose>)))
  "Returns full string definition for message of type '<real_pose>"
  (cl:format cl:nil "float32 real_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'real_pose)))
  "Returns full string definition for message of type 'real_pose"
  (cl:format cl:nil "float32 real_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <real_pose>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <real_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'real_pose
    (cl:cons ':real_pose (real_pose msg))
))
