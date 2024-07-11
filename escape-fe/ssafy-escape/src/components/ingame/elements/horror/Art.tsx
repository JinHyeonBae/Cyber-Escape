import { useGLTF } from "@react-three/drei"

interface PortraitProps {
  twoMinLater: boolean
}

const Art = ({ twoMinLater }: PortraitProps) => {
  const art = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror/art.glb",
    true,
  )
  const art2 = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror/art2.glb",
    true,
  )
  const horrorArt = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror/after_art.glb",
    true,
  )
  const horrorArt2 = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror/after_art2.glb",
    true,
  )
  return (
    <>
      {twoMinLater ? (
        <>
          <primitive object={horrorArt.scene} scale={35} />
          <primitive object={horrorArt2.scene} scale={35} />
        </>
      ) : (
        <>
          <primitive object={art.scene} scale={35} />
          <primitive object={art2.scene} scale={35} />
        </>
      )}
    </>
  )
}

export default Art
