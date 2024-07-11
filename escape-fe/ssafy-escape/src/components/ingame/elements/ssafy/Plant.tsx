import { useGLTF } from "@react-three/drei"
import { useEffect } from "react"
import IMAGE_URL from "@/constants/host"


const Plant = () => {
  const plant = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/ssafy2/plant.glb",
    true,
  )

  useEffect(() => {
    if (plant.scene) {
      plant.scene.position.set(-32, 0, -45)
    }
  }, [plant])

  return <primitive object={plant.scene} scale={1} />
}

export default Plant
